import Foundation
import DLCryptoKit

public class TransactionModel {
    
    static let TransactionDefaultLifetimeSeconds: Uint64 = 7 * 24 * 60 * 60
    
    public enum TransactionModelError: Swift.Error {
        case noOperations
    }
    
    // MARK: - Public properties
    
    public let networkParams: NetworkParams
    public let sourceAccountId: AccountID
    public let memo: Memo
    public let operations: [Operation]
    public let timeBounds: TimeBounds
    public let salt: Salt
    
    // MARK: - Private properties
    
    private var signatures: [DecoratedSignature] = []
    
    // MARK: -
    
    public init(
        networkParams: NetworkParams,
        sourceAccountId: AccountID,
        memo: Memo?,
        operations: [Operation],
        timeBounds: TimeBounds?,
        salt: Salt?
        ) throws {
        
        guard operations.count > 0 else {
            throw TransactionModelError.noOperations
        }
        
        self.networkParams = networkParams
        self.sourceAccountId = sourceAccountId
        self.operations = operations
        self.memo = memo ?? Memo.memoNone()
        self.timeBounds = timeBounds ?? TimeBounds(
            minTime: 0,
            maxTime: Uint64(Date().timeIntervalSince1970) + TransactionModel.TransactionDefaultLifetimeSeconds
        )
        
        let getRandomSalt: (() -> Salt) = {
            var rnd: Salt = 0
            arc4random_buf(&rnd, MemoryLayout.size(ofValue: rnd))
            return rnd
        }
        
        self.salt = salt ?? getRandomSalt()
    }
    
    // MARK: - Public
    
    public func addSignature(signer: ECDSA.KeyData) throws {
        let decoratedSignature = try self.getDecoratedSignature(signer: signer)
        self.signatures.append(decoratedSignature)
    }
    
    public func getEnvelope() -> TransactionEnvelope {
        return TransactionEnvelope(
            tx: self.getXdrTransaction(),
            signatures: self.signatures
        )
    }
    
    // MARK: - Private
    
    private func getDecoratedSignature(signer: ECDSA.KeyData) throws -> DecoratedSignature {
        let hash = self.getHash()
        let signature = try ECDSA.signED25519Decorated(data: hash, keyData: signer)
        
        return signature
    }
    
    private func getHash() -> Data {
        return Common.SHA.sha256(data: self.getSignatureBase())
    }
    
    private func getSignatureBase() -> Data {
        var data = Data()
        
        data.append(self.networkParams.networkId)
        
        let envelopType = self.getEnvelopType(type: .tx)
        data.append(envelopType)
        
        let xdrTransactionData = self.getXdrTransaction().toXDR()
        data.append(xdrTransactionData)
        
        return data
    }
    
    private func getXdrTransaction() -> Transaction {
        return Transaction(
            sourceAccount: self.sourceAccountId,
            salt: Salt(self.salt),
            timeBounds: self.timeBounds,
            memo: self.memo,
            operations: self.operations,
            ext: Transaction.TransactionExt.emptyVersion()
        )
    }
    
    private func getEnvelopType(type: EnvelopeType) -> Data {
        let envelopTypeBytes = type.rawValue
        
        let data = envelopTypeBytes.toXDR()
        
        return data
    }
}

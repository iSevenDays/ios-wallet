// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct TransactionEnvelope
//  {
//      Transaction tx;
//      //: list of signatures used to authorize transaction
//      DecoratedSignature signatures<20>;
//  };

//  ===========================================================================
public struct TransactionEnvelope: XDREncodable {
  public var tx: Transaction
  public var signatures: [DecoratedSignature]

  public init(
      tx: Transaction,
      signatures: [DecoratedSignature]) {

    self.tx = tx
    self.signatures = signatures
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.tx.toXDR())
    xdr.append(self.signatures.toXDR())

    return xdr
  }
}

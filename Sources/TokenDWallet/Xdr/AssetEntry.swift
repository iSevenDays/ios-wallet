// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct AssetEntry
//  {
//      AssetCode code;
//  	AccountID owner;
//  	AccountID preissuedAssetSigner; // signer of pre issuance tokens
//  	longstring details;
//  	uint64 maxIssuanceAmount; // max number of tokens to be issued
//  	uint64 availableForIssueance; // pre issued tokens available for issuance
//  	uint64 issued; // number of issued tokens
//  	uint64 pendingIssuance; // number of tokens locked for entries like token sale. lockedIssuance + issued can not be > maxIssuanceAmount
//      uint32 policies;
//      uint64 type; // use instead policies that limit usage, use in account rules
//      uint32 trailingDigitsCount;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct AssetEntry: XDREncodable {
  public var code: AssetCode
  public var owner: AccountID
  public var preissuedAssetSigner: AccountID
  public var details: Longstring
  public var maxIssuanceAmount: Uint64
  public var availableForIssueance: Uint64
  public var issued: Uint64
  public var pendingIssuance: Uint64
  public var policies: Uint32
  public var type: Uint64
  public var trailingDigitsCount: Uint32
  public var ext: AssetEntryExt

  public init(
      code: AssetCode,
      owner: AccountID,
      preissuedAssetSigner: AccountID,
      details: Longstring,
      maxIssuanceAmount: Uint64,
      availableForIssueance: Uint64,
      issued: Uint64,
      pendingIssuance: Uint64,
      policies: Uint32,
      type: Uint64,
      trailingDigitsCount: Uint32,
      ext: AssetEntryExt) {

    self.code = code
    self.owner = owner
    self.preissuedAssetSigner = preissuedAssetSigner
    self.details = details
    self.maxIssuanceAmount = maxIssuanceAmount
    self.availableForIssueance = availableForIssueance
    self.issued = issued
    self.pendingIssuance = pendingIssuance
    self.policies = policies
    self.type = type
    self.trailingDigitsCount = trailingDigitsCount
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.code.toXDR())
    xdr.append(self.owner.toXDR())
    xdr.append(self.preissuedAssetSigner.toXDR())
    xdr.append(self.details.toXDR())
    xdr.append(self.maxIssuanceAmount.toXDR())
    xdr.append(self.availableForIssueance.toXDR())
    xdr.append(self.issued.toXDR())
    xdr.append(self.pendingIssuance.toXDR())
    xdr.append(self.policies.toXDR())
    xdr.append(self.type.toXDR())
    xdr.append(self.trailingDigitsCount.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum AssetEntryExt: XDRDiscriminatedUnion {
    case emptyVersion

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion: xdr.append(Data())
      }

      return xdr
    }

  }
}

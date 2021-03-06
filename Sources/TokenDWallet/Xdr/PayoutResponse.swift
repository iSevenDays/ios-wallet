// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct PayoutResponse
//  {
//      AccountID receiverID;
//      BalanceID receiverBalanceID;
//      uint64 receivedAmount;
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
public struct PayoutResponse: XDREncodable {
  public var receiverID: AccountID
  public var receiverBalanceID: BalanceID
  public var receivedAmount: Uint64
  public var ext: PayoutResponseExt

  public init(
      receiverID: AccountID,
      receiverBalanceID: BalanceID,
      receivedAmount: Uint64,
      ext: PayoutResponseExt) {

    self.receiverID = receiverID
    self.receiverBalanceID = receiverBalanceID
    self.receivedAmount = receivedAmount
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.receiverID.toXDR())
    xdr.append(self.receiverBalanceID.toXDR())
    xdr.append(self.receivedAmount.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum PayoutResponseExt: XDRDiscriminatedUnion {
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

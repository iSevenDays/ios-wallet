// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct ExternalSystemAccountID
//  {
//      AccountID accountID;
//      int32 externalSystemType;
//  	longstring data;
//  
//  	 // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ExternalSystemAccountID: XDREncodable {
  public var accountID: AccountID
  public var externalSystemType: Int32
  public var data: Longstring
  public var ext: ExternalSystemAccountIDExt

  public init(
      accountID: AccountID,
      externalSystemType: Int32,
      data: Longstring,
      ext: ExternalSystemAccountIDExt) {

    self.accountID = accountID
    self.externalSystemType = externalSystemType
    self.data = data
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.accountID.toXDR())
    xdr.append(self.externalSystemType.toXDR())
    xdr.append(self.data.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ExternalSystemAccountIDExt: XDRDiscriminatedUnion {
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

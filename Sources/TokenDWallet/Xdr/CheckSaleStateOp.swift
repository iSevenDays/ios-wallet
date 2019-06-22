// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CheckSaleState operation is used to perform check on sale state - whether the sale was successful or not
//  struct CheckSaleStateOp
//  {
//      //:ID of the sale to check
//      uint64 saleID;
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CheckSaleStateOp: XDREncodable {
  public var saleID: Uint64
  public var ext: CheckSaleStateOpExt

  public init(
      saleID: Uint64,
      ext: CheckSaleStateOpExt) {

    self.saleID = saleID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.saleID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CheckSaleStateOpExt: XDRDiscriminatedUnion {
    case emptyVersion()

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion(): xdr.append(Data())
      }

      return xdr
    }

  }
}

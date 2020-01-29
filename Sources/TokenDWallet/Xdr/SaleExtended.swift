// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Extended result of the review request operation containing details specific to a Create Sale Request
//  struct SaleExtended {
//      //: ID of the newly created sale as a result of Create Sale Request successful review
//      uint64 saleID;
//  
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct SaleExtended: XDREncodable {
  public var saleID: Uint64
  public var ext: SaleExtendedExt

  public init(
      saleID: Uint64,
      ext: SaleExtendedExt) {

    self.saleID = saleID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.saleID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum SaleExtendedExt: XDRDiscriminatedUnion {
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

// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CancelSaleCreationRequestOp
//  {
//      //: ID of the SaleCreation request to cancel
//      uint64 requestID;
//  
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  
//  };

//  ===========================================================================
public struct CancelSaleCreationRequestOp: XDREncodable {
  public var requestID: Uint64
  public var ext: CancelSaleCreationRequestOpExt

  public init(
      requestID: Uint64,
      ext: CancelSaleCreationRequestOpExt) {

    self.requestID = requestID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CancelSaleCreationRequestOpExt: XDRDiscriminatedUnion {
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
// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreateASwapBidCreationRequestOp
//  {
//      ASwapBidCreationRequest request;
//  
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CreateASwapBidCreationRequestOp: XDREncodable {
  public var request: ASwapBidCreationRequest
  public var ext: CreateASwapBidCreationRequestOpExt

  public init(
      request: ASwapBidCreationRequest,
      ext: CreateASwapBidCreationRequestOpExt) {

    self.request = request
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.request.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CreateASwapBidCreationRequestOpExt: XDRDiscriminatedUnion {
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

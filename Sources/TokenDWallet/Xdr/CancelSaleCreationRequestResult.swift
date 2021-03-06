// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of CancelSaleCreationRequest operation application along with the result code
//  union CancelSaleCreationRequestResult switch (CancelSaleCreationRequestResultCode code)
//  {
//      case SUCCESS:
//          CancelSaleCreationSuccess success;
//      default:
//          void;
//  };

//  ===========================================================================
public enum CancelSaleCreationRequestResult: XDRDiscriminatedUnion {
  case success(CancelSaleCreationSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return CancelSaleCreationRequestResultCode.success.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .success(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
}

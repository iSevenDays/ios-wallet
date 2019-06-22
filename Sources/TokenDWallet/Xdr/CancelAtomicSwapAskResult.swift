// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of CancelASwapAskOp application
//  union CancelAtomicSwapAskResult switch (CancelAtomicSwapAskResultCode code)
//  {
//  case SUCCESS:
//      //: is used to pass useful fields after successful operation applying
//      CancelAtomicSwapAskResultSuccess success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum CancelAtomicSwapAskResult: XDRDiscriminatedUnion {
  case success(CancelAtomicSwapAskResultSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return CancelAtomicSwapAskResultCode.success.rawValue
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

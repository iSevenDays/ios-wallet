// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of ManageCreatePollRequestOp application
//  union ManageCreatePollRequestResult switch (ManageCreatePollRequestResultCode code)
//  {
//  case SUCCESS:
//      ManageCreatePollRequestSuccessResult success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ManageCreatePollRequestResult: XDRDiscriminatedUnion {
  case success(ManageCreatePollRequestSuccessResult)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageCreatePollRequestResultCode.success.rawValue
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

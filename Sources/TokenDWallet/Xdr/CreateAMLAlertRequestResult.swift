// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of `CreateAMLAlertRequest` operation application along with the result code
//  union CreateAMLAlertRequestResult switch (CreateAMLAlertRequestResultCode code)
//  {
//      case SUCCESS:
//          CreateAMLAlertRequestSuccess success;
//      default:
//          void;
//  };

//  ===========================================================================
public enum CreateAMLAlertRequestResult: XDRDiscriminatedUnion {
  case success(CreateAMLAlertRequestSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return CreateAMLAlertRequestResultCode.success.rawValue
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

// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of the License operation application
//  union LicenseResult switch (LicenseResultCode code)
//  {
//  case SUCCESS:
//      LicenseSuccess success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum LicenseResult: XDRDiscriminatedUnion {
  case success(LicenseSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return LicenseResultCode.success.rawValue
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

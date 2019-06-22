// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of operation application
//  union ManageExternalSystemAccountIdPoolEntryResult switch (ManageExternalSystemAccountIdPoolEntryResultCode code)
//  {
//  case SUCCESS:
//      ManageExternalSystemAccountIdPoolEntrySuccess success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ManageExternalSystemAccountIdPoolEntryResult: XDRDiscriminatedUnion {
  case success(ManageExternalSystemAccountIdPoolEntrySuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageExternalSystemAccountIdPoolEntryResultCode.success.rawValue
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

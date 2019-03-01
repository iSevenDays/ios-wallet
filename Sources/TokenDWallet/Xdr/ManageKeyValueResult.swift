// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union ManageKeyValueResult switch (ManageKeyValueResultCode code)
//      {
//          case SUCCESS:
//              ManageKeyValueSuccess success;
//          default:
//              void;
//      };

//  ===========================================================================
public enum ManageKeyValueResult: XDRDiscriminatedUnion {
  case success(ManageKeyValueSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageKeyValueResultCode.success.rawValue
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
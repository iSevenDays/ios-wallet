// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: BindExternalSystemAccountIdOp is used to bind a particular account to the external system account which is represented by account ID taken from the pool
//  struct BindExternalSystemAccountIdOp
//  {
//      //: Type of external system to bind
//      int32 externalSystemType;
//  
//      //: Reserved for the future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct BindExternalSystemAccountIdOp: XDREncodable {
  public var externalSystemType: Int32
  public var ext: BindExternalSystemAccountIdOpExt

  public init(
      externalSystemType: Int32,
      ext: BindExternalSystemAccountIdOpExt) {

    self.externalSystemType = externalSystemType
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.externalSystemType.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum BindExternalSystemAccountIdOpExt: XDRDiscriminatedUnion {
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

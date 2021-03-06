// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Is used to pass result of operation applying
//      union SetFeesResult switch (SetFeesResultCode code)
//      {
//          case SUCCESS:
//              struct {
//                  //: reserved for future use
//                  union switch (LedgerVersion v)
//                  {
//                  case EMPTY_VERSION:
//                      void;
//                  }
//                  ext;
//              } success;
//          default:
//              void;
//      };

//  ===========================================================================
public enum SetFeesResult: XDRDiscriminatedUnion {
  case success(SetFeesResultSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return SetFeesResultCode.success.rawValue
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
  public struct SetFeesResultSuccess: XDREncodable {
    public var ext: SetFeesResultSuccessExt

    public init(
        ext: SetFeesResultSuccessExt) {

      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.ext.toXDR())

      return xdr
    }

    public enum SetFeesResultSuccessExt: XDRDiscriminatedUnion {
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
}

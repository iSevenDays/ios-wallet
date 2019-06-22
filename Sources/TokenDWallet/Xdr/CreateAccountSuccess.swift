// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of successful application of `CreateAccount` operation
//  struct CreateAccountSuccess
//  {
//      //: Unique unsigned integer identifier of the new account
//      uint64 sequentialID;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CreateAccountSuccess: XDREncodable {
  public var sequentialID: Uint64
  public var ext: CreateAccountSuccessExt

  public init(
      sequentialID: Uint64,
      ext: CreateAccountSuccessExt) {

    self.sequentialID = sequentialID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.sequentialID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CreateAccountSuccessExt: XDRDiscriminatedUnion {
    case emptyVersion()

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion(): xdr.append(Data())
      }

      return xdr
    }

  }
}

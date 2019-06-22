// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CancelPollRequestData is used to pass necessary data to remove a `CREATE_POLL` request
//  struct CancelPollRequestData
//  {
//      //: ID of `CREATE_POLL` request to remove
//      uint64 requestID;
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
public struct CancelPollRequestData: XDREncodable {
  public var requestID: Uint64
  public var ext: CancelPollRequestDataExt

  public init(
      requestID: Uint64,
      ext: CancelPollRequestDataExt) {

    self.requestID = requestID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CancelPollRequestDataExt: XDRDiscriminatedUnion {
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

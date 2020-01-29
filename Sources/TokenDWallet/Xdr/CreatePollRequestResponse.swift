// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreatePollRequestResponse is used to pass useful fields after `CREATE_POLL` request creation
//  struct CreatePollRequestResponse
//  {
//      //: ID of a created request
//      uint64 requestID;
//  
//      //: Indicates whether or not the `CREATE_POLL` request was auto approved and fulfilled
//      //: True means that poll was successfully created
//      bool fulfilled;
//  
//      //: ID of created poll if request was fulfilled
//      uint64* pollID;
//  
//      //: reserved for the future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CreatePollRequestResponse: XDREncodable {
  public var requestID: Uint64
  public var fulfilled: Bool
  public var pollID: Uint64?
  public var ext: CreatePollRequestResponseExt

  public init(
      requestID: Uint64,
      fulfilled: Bool,
      pollID: Uint64?,
      ext: CreatePollRequestResponseExt) {

    self.requestID = requestID
    self.fulfilled = fulfilled
    self.pollID = pollID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.fulfilled.toXDR())
    xdr.append(self.pollID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CreatePollRequestResponseExt: XDRDiscriminatedUnion {
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

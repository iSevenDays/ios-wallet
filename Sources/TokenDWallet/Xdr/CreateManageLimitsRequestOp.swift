// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreateManageLimitsRequestOp is used to create a reviewable request which, after approval, will update the limits set in the system
//  struct CreateManageLimitsRequestOp
//  {
//      //: Body of the `UpdateLimits` reviewable request to be created
//      LimitsUpdateRequest manageLimitsRequest;
//  
//      //: (optional) Bit mask whose flags must be cleared in order for ManageLimits request to be approved, which will be used instead of value from the key-value pair 
//      //: by key `limits_update_tasks`
//      uint32* allTasks;
//      //: ID of the LimitsUpdateRequest
//      //: If `requestID == 0`, operation creates a new limits entry; otherwise, it updates the existing one
//      uint64 requestID;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct CreateManageLimitsRequestOp: XDREncodable {
  public var manageLimitsRequest: LimitsUpdateRequest
  public var allTasks: Uint32?
  public var requestID: Uint64
  public var ext: CreateManageLimitsRequestOpExt

  public init(
      manageLimitsRequest: LimitsUpdateRequest,
      allTasks: Uint32?,
      requestID: Uint64,
      ext: CreateManageLimitsRequestOpExt) {

    self.manageLimitsRequest = manageLimitsRequest
    self.allTasks = allTasks
    self.requestID = requestID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.manageLimitsRequest.toXDR())
    xdr.append(self.allTasks.toXDR())
    xdr.append(self.requestID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CreateManageLimitsRequestOpExt: XDRDiscriminatedUnion {
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

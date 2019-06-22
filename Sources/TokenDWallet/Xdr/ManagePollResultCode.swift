// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result codes of ManagePollOp
//  enum ManagePollResultCode
//  {
//      //: Specified action in `data` of ManagePollOp was successfully executed
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      //: There is no poll with such id
//      NOT_FOUND = -1,
//      //: Not allowed to close poll which
//      POLL_NOT_READY = -2,
//      //: Only result provider is allowed to close poll
//      NOT_AUTHORIZED_TO_CLOSE_POLL = -3,
//      //: End time is in the past
//      INVALID_END_TIME = -4,
//      //: Only poll owner and admin are allowed to cancel poll and update end time
//      NOT_AUTHORIZED = -5
//  };

//  ===========================================================================
public enum ManagePollResultCode: Int32, XDREnum {
  case success = 0
  case notFound = -1
  case pollNotReady = -2
  case notAuthorizedToClosePoll = -3
  case invalidEndTime = -4
  case notAuthorized = -5
}

// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Actions that can be performed on request that is being reviewed
//  enum ReviewRequestOpAction {
//      //: Approve request
//      APPROVE = 1,
//      //: Reject request
//      REJECT = 2,
//      //: Permanently reject request
//      PERMANENT_REJECT = 3
//  };

//  ===========================================================================
public enum ReviewRequestOpAction: Int32, XDREnum {
  case approve = 1
  case reject = 2
  case permanentReject = 3
}

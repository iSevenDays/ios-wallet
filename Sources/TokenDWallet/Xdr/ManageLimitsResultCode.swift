// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum ManageLimitsResultCode
//  {
//      // codes considered as "success" for the operation
//      //: `ManageLimitsOp` was successfully applied
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      //: (reserved for future use) Invalid input
//      MALFORMED = -1,
//      //: Limits entry not found
//      NOT_FOUND = -2,
//      //: (reserved for future use) Limits entry already exists
//      ALREADY_EXISTS = -3,
//      //: Limits cannot be created for account ID and account role simultaneously
//      CANNOT_CREATE_FOR_ACC_ID_AND_ACC_TYPE = -4, // FIXME ACC_ROLE ?
//      //: Limits entry is invalid (e.g. weeklyOut is less than dailyOut)
//      INVALID_LIMITS = -5
//  };

//  ===========================================================================
public enum ManageLimitsResultCode: Int32, XDREnum {
  case success = 0
  case malformed = -1
  case notFound = -2
  case alreadyExists = -3
  case cannotCreateForAccIdAndAccType = -4
  case invalidLimits = -5
}
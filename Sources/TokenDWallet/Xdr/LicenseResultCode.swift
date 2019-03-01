// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum LicenseResultCode
//  {
//      //: License submit was successful, provided adminCount and dueDate were set in the system
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      //: Provided ledger hash and license hash were not stamped and missing in the system.
//      INVALID_STAMP = -1,
//      //: Provided due date is in the past.
//      INVALID_DUE_DATE = -2,
//      //: Not enough valid signatures to submit license (required at least one valid signature)
//      INVALID_SIGNATURE = -3
//  };

//  ===========================================================================
public enum LicenseResultCode: Int32, XDREnum {
  case success = 0
  case invalidStamp = -1
  case invalidDueDate = -2
  case invalidSignature = -3
}
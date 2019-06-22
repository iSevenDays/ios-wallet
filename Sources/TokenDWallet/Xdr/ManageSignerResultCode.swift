// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result codes of ManageSignerOp
//  enum ManageSignerResultCode
//  {
//      //: Specified action in `data` of ManageSignerOp was successfully executed
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      //: Passed details have invalid json structure
//      INVALID_DETAILS = -1, // invalid json details
//      //: Signer with such public key is already attached to the source account
//      ALREADY_EXISTS = -2, // signer already exist
//      //: There is no role with such id
//      NO_SUCH_ROLE = -3,
//      //: It is not allowed to set weight more than 1000
//      INVALID_WEIGHT = -4, // more than 1000
//      //: Source account does not have a signer with the provided public key
//      NOT_FOUND = -5, // there is no signer with such public key
//      //: only occurs during the creation of signers for admins if the number of signers exceeds the number specified in a license
//  	NUMBER_OF_ADMINS_EXCEEDS_LICENSE = -6
//  };

//  ===========================================================================
public enum ManageSignerResultCode: Int32, XDREnum {
  case success = 0
  case invalidDetails = -1
  case alreadyExists = -2
  case noSuchRole = -3
  case invalidWeight = -4
  case notFound = -5
  case numberOfAdminsExceedsLicense = -6
}

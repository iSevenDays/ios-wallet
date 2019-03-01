// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum CreateASwapRequestResultCode
//  {
//      // codes considered as "success" for the operation
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      INVALID_BASE_AMOUNT = -1,
//      INVALID_QUOTE_ASSET = -2,
//      BID_NOT_FOUND = -3,
//      QUOTE_ASSET_NOT_FOUND = -4,
//      BID_UNDERFUNDED = -5, // bid has not enough base amount available for lock
//      ATOMIC_SWAP_TASKS_NOT_FOUND = -6,
//      NOT_ALLOWED_BY_ASSET_POLICY = -7,
//      BID_IS_CANCELLED = -8,
//      CANNOT_CREATE_ASWAP_REQUEST_FOR_OWN_BID = -9
//  };

//  ===========================================================================
public enum CreateASwapRequestResultCode: Int32, XDREnum {
  case success = 0
  case invalidBaseAmount = -1
  case invalidQuoteAsset = -2
  case bidNotFound = -3
  case quoteAssetNotFound = -4
  case bidUnderfunded = -5
  case atomicSwapTasksNotFound = -6
  case notAllowedByAssetPolicy = -7
  case bidIsCancelled = -8
  case cannotCreateAswapRequestForOwnBid = -9
}
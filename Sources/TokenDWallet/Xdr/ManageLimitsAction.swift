// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: `ManageLimitsAction` defines which action can be performed on the Limits entry
//  enum ManageLimitsAction
//  {
//      CREATE = 0,
//      REMOVE = 1
//  };

//  ===========================================================================
public enum ManageLimitsAction: Int32, XDREnum {
  case create = 0
  case remove = 1
}

// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Actions that can be applied to a `CREATE_POLL` request
//  enum ManageCreatePollRequestAction
//  {
//      CREATE = 0,
//      CANCEL = 1
//  };

//  ===========================================================================
public enum ManageCreatePollRequestAction: Int32, XDREnum {
  case create = 0
  case cancel = 1
}

// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum LedgerUpgradeType
//  {
//      VERSION = 1,
//      MAX_TX_SET_SIZE = 2,
//      TX_EXPIRATION_PERIOD = 3
//  };

//  ===========================================================================
public enum LedgerUpgradeType: Int32, XDREnum {
  case version = 1
  case maxTxSetSize = 2
  case txExpirationPeriod = 3
}
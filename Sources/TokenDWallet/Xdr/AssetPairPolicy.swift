// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum AssetPairPolicy
//  {
//  	TRADEABLE_SECONDARY_MARKET = 1, // if not set pair can not be traided on secondary market
//  	PHYSICAL_PRICE_RESTRICTION = 2, // if set, then prices for new offers must be greater then physical price with correction
//  	CURRENT_PRICE_RESTRICTION = 4 // if set, then price for new offers must be in interval of (1 +- maxPriceStep)*currentPrice
//  };

//  ===========================================================================
public enum AssetPairPolicy: Int32, XDREnum {
  case tradeableSecondaryMarket = 1
  case physicalPriceRestriction = 2
  case currentPriceRestriction = 4
}
// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum ManageOfferResultCode
//  {
//      // codes considered as "success" for the operation
//      //: ManageOfferOp was successfully applied
//      SUCCESS = 0,
//      
//      // codes considered as "failure" for the operation
//      //: Either the quote amount is less than the fee or the new fee is less than the old one
//      MALFORMED = -1,
//      //: Asset pair does not allow creating offers with it
//      PAIR_NOT_TRADED = -2, 
//      //: Source account of an operation does not owns one of the provided balances
//      BALANCE_NOT_FOUND = -3,
//      //: One of the balances does not hold the amount that it is trying to sell
//      UNDERFUNDED = -4,
//      //: Offer will cross with another offer of the same user 
//      CROSS_SELF = -5,
//      //: Overflow happened during the quote amount or fee calculation
//      OFFER_OVERFLOW = -6,
//      //: Either an asset pair does not exist or base and quote assets are the same
//      ASSET_PAIR_NOT_TRADABLE = -7,
//      //: Offer price violates the physical price restriction
//      PHYSICAL_PRICE_RESTRICTION = -8,
//      //: Offer price violates the current price restriction
//      CURRENT_PRICE_RESTRICTION = -9,
//      //: Offer with provided offerID is not found
//      NOT_FOUND = -10,
//      //: Negative fee is not allowed
//      INVALID_PERCENT_FEE = -11,
//      //: Price is too small
//      INSUFFICIENT_PRICE = -12,
//      //: Order book with provided ID does not exist
//      ORDER_BOOK_DOES_NOT_EXISTS = -13,
//      //: Sale has not started yet
//      SALE_IS_NOT_STARTED_YET = -14,
//      //: Sale has already ended
//      SALE_ALREADY_ENDED = -15,
//      //: CurrentCap of sale + offer amount will exceed the hard cap of the sale
//      ORDER_VIOLATES_HARD_CAP = -16,
//      //: Offer creator cannot participate in their own sale
//      CANT_PARTICIPATE_OWN_SALE = -17,
//      //: Sale assets and assets for specified balances are mismatched
//      ASSET_MISMATCHED = -18,
//      //: Sale price and offer price are mismatched
//      PRICE_DOES_NOT_MATCH = -19,
//      //: Price must be positive
//      PRICE_IS_INVALID = -20,
//      //: Offer update is not allowed
//      UPDATE_IS_NOT_ALLOWED = -21,
//      //: Amount must be positive
//      INVALID_AMOUNT = -22,
//      //: Sale is not active
//      SALE_IS_NOT_ACTIVE = -23,
//      //: Source must have KYC in order to participate
//      REQUIRES_KYC = -24,
//      //: Source account is underfunded
//      SOURCE_UNDERFUNDED = -25,
//      //: Overflow happened during the balance lock
//      SOURCE_BALANCE_LOCK_OVERFLOW = -26,
//      //: Source account must be verified in order to participate
//      REQUIRES_VERIFICATION = -27,
//      //: Precision set in the system and precision of the amount are mismatched
//      INCORRECT_AMOUNT_PRECISION = -28,
//      //: Sale specific rule forbids to participate in sale for source account
//      SPECIFIC_RULE_FORBIDS = -29
//  };

//  ===========================================================================
public enum ManageOfferResultCode: Int32, XDREnum {
  case success = 0
  case malformed = -1
  case pairNotTraded = -2
  case balanceNotFound = -3
  case underfunded = -4
  case crossSelf = -5
  case offerOverflow = -6
  case assetPairNotTradable = -7
  case physicalPriceRestriction = -8
  case currentPriceRestriction = -9
  case notFound = -10
  case invalidPercentFee = -11
  case insufficientPrice = -12
  case orderBookDoesNotExists = -13
  case saleIsNotStartedYet = -14
  case saleAlreadyEnded = -15
  case orderViolatesHardCap = -16
  case cantParticipateOwnSale = -17
  case assetMismatched = -18
  case priceDoesNotMatch = -19
  case priceIsInvalid = -20
  case updateIsNotAllowed = -21
  case invalidAmount = -22
  case saleIsNotActive = -23
  case requiresKyc = -24
  case sourceUnderfunded = -25
  case sourceBalanceLockOverflow = -26
  case requiresVerification = -27
  case incorrectAmountPrecision = -28
  case specificRuleForbids = -29
}

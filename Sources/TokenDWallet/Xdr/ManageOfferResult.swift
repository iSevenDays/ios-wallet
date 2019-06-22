// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of `ManageOfferOp`
//  union ManageOfferResult switch (ManageOfferResultCode code)
//  {
//  case SUCCESS:
//      ManageOfferSuccessResult success;
//  case PHYSICAL_PRICE_RESTRICTION:
//      struct {
//          //: Physical price of the base asset
//          int64 physicalPrice;
//          //: Reserved for future use
//          union switch (LedgerVersion v)
//          {
//          case EMPTY_VERSION:
//              void;
//          }
//          ext;
//      } physicalPriceRestriction;
//  case CURRENT_PRICE_RESTRICTION:
//      struct {
//          //: Current price of the base asset
//          int64 currentPrice;
//          //: Reserved for future use
//          union switch (LedgerVersion v)
//          {
//          case EMPTY_VERSION:
//              void;
//          }
//          ext;
//      } currentPriceRestriction;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ManageOfferResult: XDRDiscriminatedUnion {
  case success(ManageOfferSuccessResult)
  case physicalPriceRestriction(ManageOfferResultPhysicalPriceRestriction)
  case currentPriceRestriction(ManageOfferResultCurrentPriceRestriction)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageOfferResultCode.success.rawValue
    case .physicalPriceRestriction: return ManageOfferResultCode.physicalPriceRestriction.rawValue
    case .currentPriceRestriction: return ManageOfferResultCode.currentPriceRestriction.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .success(let data): xdr.append(data.toXDR())
    case .physicalPriceRestriction(let data): xdr.append(data.toXDR())
    case .currentPriceRestriction(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
  public struct ManageOfferResultPhysicalPriceRestriction: XDREncodable {
    public var physicalPrice: Int64
    public var ext: ManageOfferResultPhysicalPriceRestrictionExt

    public init(
        physicalPrice: Int64,
        ext: ManageOfferResultPhysicalPriceRestrictionExt) {

      self.physicalPrice = physicalPrice
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.physicalPrice.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

    public enum ManageOfferResultPhysicalPriceRestrictionExt: XDRDiscriminatedUnion {
      case emptyVersion()

      public var discriminant: Int32 {
        switch self {
        case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
        }
      }

      public func toXDR() -> Data {
        var xdr = Data()

        xdr.append(self.discriminant.toXDR())

        switch self {
        case .emptyVersion(): xdr.append(Data())
        }

        return xdr
      }

    }
  }
  public struct ManageOfferResultCurrentPriceRestriction: XDREncodable {
    public var currentPrice: Int64
    public var ext: ManageOfferResultCurrentPriceRestrictionExt

    public init(
        currentPrice: Int64,
        ext: ManageOfferResultCurrentPriceRestrictionExt) {

      self.currentPrice = currentPrice
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.currentPrice.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

    public enum ManageOfferResultCurrentPriceRestrictionExt: XDRDiscriminatedUnion {
      case emptyVersion()

      public var discriminant: Int32 {
        switch self {
        case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
        }
      }

      public func toXDR() -> Data {
        var xdr = Data()

        xdr.append(self.discriminant.toXDR())

        switch self {
        case .emptyVersion(): xdr.append(Data())
        }

        return xdr
      }

    }
  }
}

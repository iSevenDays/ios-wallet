// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union SaleTypeExt switch (SaleType saleType)
//  {
//  	case BASIC_SALE:
//  		BasicSale basicSale;
//  	case CROWD_FUNDING:
//  		CrowdFundingSale crowdFundingSale;
//  	case FIXED_PRICE:
//  		FixedPriceSale fixedPriceSale;
//  };

//  ===========================================================================
public enum SaleTypeExt: XDRDiscriminatedUnion {
  case basicSale(BasicSale)
  case crowdFunding(CrowdFundingSale)
  case fixedPrice(FixedPriceSale)

  public var discriminant: Int32 {
    switch self {
    case .basicSale: return SaleType.basicSale.rawValue
    case .crowdFunding: return SaleType.crowdFunding.rawValue
    case .fixedPrice: return SaleType.fixedPrice.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .basicSale(let data): xdr.append(data.toXDR())
    case .crowdFunding(let data): xdr.append(data.toXDR())
    case .fixedPrice(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
}

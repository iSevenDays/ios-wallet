// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: SaleCreationRequestQuoteAsset is a structure that contains an asset code with price
//  struct SaleCreationRequestQuoteAsset {
//      //: AssetCode of quote asset 
//      AssetCode quoteAsset; // asset in which participation will be accepted
//      //: Price of sale base asset in relation to a quote asset
//      uint64 price; // price for 1 baseAsset in relation to a quote asset
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct SaleCreationRequestQuoteAsset: XDREncodable {
  public var quoteAsset: AssetCode
  public var price: Uint64
  public var ext: SaleCreationRequestQuoteAssetExt

  public init(
      quoteAsset: AssetCode,
      price: Uint64,
      ext: SaleCreationRequestQuoteAssetExt) {

    self.quoteAsset = quoteAsset
    self.price = price
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.quoteAsset.toXDR())
    xdr.append(self.price.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum SaleCreationRequestQuoteAssetExt: XDRDiscriminatedUnion {
    case emptyVersion

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion: xdr.append(Data())
      }

      return xdr
    }

  }
}

// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: AtomicSwapAskQuoteAsset represents asset with price which can be used to buy base asset
//  struct AtomicSwapAskQuoteAsset
//  {
//      //: Code of quote asset
//      AssetCode quoteAsset;
//      //: amount of quote asset which is needed to buy one base asset
//      uint64 price;
//      //: reserved for the future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct AtomicSwapAskQuoteAsset: XDREncodable {
  public var quoteAsset: AssetCode
  public var price: Uint64
  public var ext: AtomicSwapAskQuoteAssetExt

  public init(
      quoteAsset: AssetCode,
      price: Uint64,
      ext: AtomicSwapAskQuoteAssetExt) {

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

  public enum AtomicSwapAskQuoteAssetExt: XDRDiscriminatedUnion {
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

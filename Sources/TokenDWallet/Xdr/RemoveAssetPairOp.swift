// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: `RemoveAssetPairOp` removes specified asset pair
//  struct RemoveAssetPairOp
//  {
//      //: Defines a base asset of an asset pair
//      AssetCode base;
//      //: Defines a base asset of an asset pair
//      AssetCode quote;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct RemoveAssetPairOp: XDREncodable {
  public var base: AssetCode
  public var quote: AssetCode
  public var ext: RemoveAssetPairOpExt

  public init(
      base: AssetCode,
      quote: AssetCode,
      ext: RemoveAssetPairOpExt) {

    self.base = base
    self.quote = quote
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.base.toXDR())
    xdr.append(self.quote.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum RemoveAssetPairOpExt: XDRDiscriminatedUnion {
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

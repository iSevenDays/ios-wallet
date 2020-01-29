// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: `ManageAssetPairOp` either creates new asset pairs or updates prices or policies of existing [asset pairs](#operation/assetPairResources)
//  struct ManageAssetPairOp
//  {
//      //: Defines a ManageBalanceAction that will be performed on an asset pair
//      ManageAssetPairAction action;
//      //: Defines a base asset of an asset pair
//      AssetCode base;
//      //: Defines a base asset of an asset pair
//      AssetCode quote;
//  
//      //: New physical price of the asset pair which would be set after successful `ManageAssetPairOp` application
//      int64 physicalPrice;
//  
//      //: New correction of the asset pair physical price in percents
//      int64 physicalPriceCorrection;
//      //: New maximal price step of asset pair
//      int64 maxPriceStep;
//  
//      //: Bitmask of asset policies set by the creator or corrected by manage asset operations
//      int32 policies;
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
public struct ManageAssetPairOp: XDREncodable {
  public var action: ManageAssetPairAction
  public var base: AssetCode
  public var quote: AssetCode
  public var physicalPrice: Int64
  public var physicalPriceCorrection: Int64
  public var maxPriceStep: Int64
  public var policies: Int32
  public var ext: ManageAssetPairOpExt

  public init(
      action: ManageAssetPairAction,
      base: AssetCode,
      quote: AssetCode,
      physicalPrice: Int64,
      physicalPriceCorrection: Int64,
      maxPriceStep: Int64,
      policies: Int32,
      ext: ManageAssetPairOpExt) {

    self.action = action
    self.base = base
    self.quote = quote
    self.physicalPrice = physicalPrice
    self.physicalPriceCorrection = physicalPriceCorrection
    self.maxPriceStep = maxPriceStep
    self.policies = policies
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.action.toXDR())
    xdr.append(self.base.toXDR())
    xdr.append(self.quote.toXDR())
    xdr.append(self.physicalPrice.toXDR())
    xdr.append(self.physicalPriceCorrection.toXDR())
    xdr.append(self.maxPriceStep.toXDR())
    xdr.append(self.policies.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ManageAssetPairOpExt: XDRDiscriminatedUnion {
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

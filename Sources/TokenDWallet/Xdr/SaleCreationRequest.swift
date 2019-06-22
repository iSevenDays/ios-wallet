// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: SaleCreationRequest is used to create a sale with provided parameters
//  struct SaleCreationRequest
//  {   
//      //: Type of sale
//      //: 1: basic sale
//      //: 2: crowdfunding sale
//      //: 3: fixed price sale
//      uint64 saleType;
//      //: Asset code of an asset to sell on sale
//      AssetCode baseAsset; // asset for which sale will be performed
//      //: Asset code of an asset used to calculcate soft cap and hard cap
//      AssetCode defaultQuoteAsset; // asset for soft and hard cap
//      //: Time when the sale should start
//      uint64 startTime; // start time of the sale
//      //: Time when the sale should end
//      uint64 endTime; // close time of the sale
//      //: Minimal amount (in default quote asset) that has to be sold on sale for it to be considered successful
//      uint64 softCap; // minimum amount of quote asset to be received at which sale will be considered a successful
//      //: Maximal amount (in default quote asset) to be received during the sale. Sale closes immediately after reaching the hard cap
//      uint64 hardCap; // max amount of quote asset to be received
//      //: Arbitrary stringified JSON object that can be used to attach data to be reviewed by an admin
//      longstring creatorDetails; // details set by requester
//      //: Parameters specific to a particular sale type
//      SaleTypeExt saleTypeExt;
//      //: 
//      uint64 requiredBaseAssetForHardCap;
//      //: Used to keep track of rejected requests updates. `SequenceNumber` increases after each rejected SaleCreationRequest update.
//      uint32 sequenceNumber;
//      //: Array of quote assets that are available for participation
//      SaleCreationRequestQuoteAsset quoteAssets<100>;
//      //: Use `EMPTY_VERSION` to allow anyone participate in sale,
//      //: use `ADD_SALE_WHITELISTS` to specify sale participation rules
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      case ADD_SALE_WHITELISTS:
//          //: array of rules that define participation rules. One global rule must be specified. 
//          CreateAccountSaleRuleData saleRules<>;
//      }
//      ext;
//  };

//  ===========================================================================
public struct SaleCreationRequest: XDREncodable {
  public var saleType: Uint64
  public var baseAsset: AssetCode
  public var defaultQuoteAsset: AssetCode
  public var startTime: Uint64
  public var endTime: Uint64
  public var softCap: Uint64
  public var hardCap: Uint64
  public var creatorDetails: Longstring
  public var saleTypeExt: SaleTypeExt
  public var requiredBaseAssetForHardCap: Uint64
  public var sequenceNumber: Uint32
  public var quoteAssets: [SaleCreationRequestQuoteAsset]
  public var ext: SaleCreationRequestExt

  public init(
      saleType: Uint64,
      baseAsset: AssetCode,
      defaultQuoteAsset: AssetCode,
      startTime: Uint64,
      endTime: Uint64,
      softCap: Uint64,
      hardCap: Uint64,
      creatorDetails: Longstring,
      saleTypeExt: SaleTypeExt,
      requiredBaseAssetForHardCap: Uint64,
      sequenceNumber: Uint32,
      quoteAssets: [SaleCreationRequestQuoteAsset],
      ext: SaleCreationRequestExt) {

    self.saleType = saleType
    self.baseAsset = baseAsset
    self.defaultQuoteAsset = defaultQuoteAsset
    self.startTime = startTime
    self.endTime = endTime
    self.softCap = softCap
    self.hardCap = hardCap
    self.creatorDetails = creatorDetails
    self.saleTypeExt = saleTypeExt
    self.requiredBaseAssetForHardCap = requiredBaseAssetForHardCap
    self.sequenceNumber = sequenceNumber
    self.quoteAssets = quoteAssets
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.saleType.toXDR())
    xdr.append(self.baseAsset.toXDR())
    xdr.append(self.defaultQuoteAsset.toXDR())
    xdr.append(self.startTime.toXDR())
    xdr.append(self.endTime.toXDR())
    xdr.append(self.softCap.toXDR())
    xdr.append(self.hardCap.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.saleTypeExt.toXDR())
    xdr.append(self.requiredBaseAssetForHardCap.toXDR())
    xdr.append(self.sequenceNumber.toXDR())
    xdr.append(self.quoteAssets.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum SaleCreationRequestExt: XDRDiscriminatedUnion {
    case emptyVersion()
    case addSaleWhitelists([CreateAccountSaleRuleData])

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      case .addSaleWhitelists: return LedgerVersion.addSaleWhitelists.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion(): xdr.append(Data())
      case .addSaleWhitelists(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

  }
}

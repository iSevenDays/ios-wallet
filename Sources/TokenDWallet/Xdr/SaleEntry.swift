// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct SaleEntry
//  {
//  	uint64 saleID;
//  	uint64 saleType;
//  	AccountID ownerID;
//      AssetCode baseAsset; // asset for which sale will be performed
//  	uint64 startTime; // start time of the sale
//  	uint64 endTime; // close time of the sale
//  	AssetCode defaultQuoteAsset; // asset for soft and hard cap
//  	uint64 softCap; // minimum amount of quote asset to be received at which sale will be considered a successful
//  	uint64 hardCap; // max amount of quote asset to be received
//  	uint64 currentCapInBase;
//  	uint64 maxAmountToBeSold;
//  	longstring details; // sale specific details
//  	SaleQuoteAsset quoteAssets<100>;
//  
//  	BalanceID baseBalance;
//      SaleTypeExt saleTypeExt;
//  
//  	union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      case ADD_SALE_WHITELISTS:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct SaleEntry: XDREncodable {
  public var saleID: Uint64
  public var saleType: Uint64
  public var ownerID: AccountID
  public var baseAsset: AssetCode
  public var startTime: Uint64
  public var endTime: Uint64
  public var defaultQuoteAsset: AssetCode
  public var softCap: Uint64
  public var hardCap: Uint64
  public var currentCapInBase: Uint64
  public var maxAmountToBeSold: Uint64
  public var details: Longstring
  public var quoteAssets: [SaleQuoteAsset]
  public var baseBalance: BalanceID
  public var saleTypeExt: SaleTypeExt
  public var ext: SaleEntryExt

  public init(
      saleID: Uint64,
      saleType: Uint64,
      ownerID: AccountID,
      baseAsset: AssetCode,
      startTime: Uint64,
      endTime: Uint64,
      defaultQuoteAsset: AssetCode,
      softCap: Uint64,
      hardCap: Uint64,
      currentCapInBase: Uint64,
      maxAmountToBeSold: Uint64,
      details: Longstring,
      quoteAssets: [SaleQuoteAsset],
      baseBalance: BalanceID,
      saleTypeExt: SaleTypeExt,
      ext: SaleEntryExt) {

    self.saleID = saleID
    self.saleType = saleType
    self.ownerID = ownerID
    self.baseAsset = baseAsset
    self.startTime = startTime
    self.endTime = endTime
    self.defaultQuoteAsset = defaultQuoteAsset
    self.softCap = softCap
    self.hardCap = hardCap
    self.currentCapInBase = currentCapInBase
    self.maxAmountToBeSold = maxAmountToBeSold
    self.details = details
    self.quoteAssets = quoteAssets
    self.baseBalance = baseBalance
    self.saleTypeExt = saleTypeExt
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.saleID.toXDR())
    xdr.append(self.saleType.toXDR())
    xdr.append(self.ownerID.toXDR())
    xdr.append(self.baseAsset.toXDR())
    xdr.append(self.startTime.toXDR())
    xdr.append(self.endTime.toXDR())
    xdr.append(self.defaultQuoteAsset.toXDR())
    xdr.append(self.softCap.toXDR())
    xdr.append(self.hardCap.toXDR())
    xdr.append(self.currentCapInBase.toXDR())
    xdr.append(self.maxAmountToBeSold.toXDR())
    xdr.append(self.details.toXDR())
    xdr.append(self.quoteAssets.toXDR())
    xdr.append(self.baseBalance.toXDR())
    xdr.append(self.saleTypeExt.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum SaleEntryExt: XDRDiscriminatedUnion {
    case emptyVersion()
    case addSaleWhitelists()

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
      case .addSaleWhitelists(): xdr.append(Data())
      }

      return xdr
    }

  }
}

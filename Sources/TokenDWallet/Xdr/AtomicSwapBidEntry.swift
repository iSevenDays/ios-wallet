// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct AtomicSwapBidEntry
//  {
//      uint64 bidID;
//      AccountID ownerID;
//      AssetCode baseAsset;
//      BalanceID baseBalance;
//      uint64 amount;
//      uint64 lockedAmount;
//      uint64 createdAt;
//  
//      bool isCancelled;
//  
//      longstring details;
//  
//      ASwapBidQuoteAsset quoteAssets<>;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct AtomicSwapBidEntry: XDREncodable {
  public var bidID: Uint64
  public var ownerID: AccountID
  public var baseAsset: AssetCode
  public var baseBalance: BalanceID
  public var amount: Uint64
  public var lockedAmount: Uint64
  public var createdAt: Uint64
  public var isCancelled: Bool
  public var details: Longstring
  public var quoteAssets: [ASwapBidQuoteAsset]
  public var ext: AtomicSwapBidEntryExt

  public init(
      bidID: Uint64,
      ownerID: AccountID,
      baseAsset: AssetCode,
      baseBalance: BalanceID,
      amount: Uint64,
      lockedAmount: Uint64,
      createdAt: Uint64,
      isCancelled: Bool,
      details: Longstring,
      quoteAssets: [ASwapBidQuoteAsset],
      ext: AtomicSwapBidEntryExt) {

    self.bidID = bidID
    self.ownerID = ownerID
    self.baseAsset = baseAsset
    self.baseBalance = baseBalance
    self.amount = amount
    self.lockedAmount = lockedAmount
    self.createdAt = createdAt
    self.isCancelled = isCancelled
    self.details = details
    self.quoteAssets = quoteAssets
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.bidID.toXDR())
    xdr.append(self.ownerID.toXDR())
    xdr.append(self.baseAsset.toXDR())
    xdr.append(self.baseBalance.toXDR())
    xdr.append(self.amount.toXDR())
    xdr.append(self.lockedAmount.toXDR())
    xdr.append(self.createdAt.toXDR())
    xdr.append(self.isCancelled.toXDR())
    xdr.append(self.details.toXDR())
    xdr.append(self.quoteAssets.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum AtomicSwapBidEntryExt: XDRDiscriminatedUnion {
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

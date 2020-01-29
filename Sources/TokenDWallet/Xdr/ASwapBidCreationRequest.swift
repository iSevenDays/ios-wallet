// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct ASwapBidCreationRequest
//  {
//      BalanceID baseBalance;
//      uint64 amount;
//      longstring creatorDetails; // details set by requester
//  
//      ASwapBidQuoteAsset quoteAssets<>;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct ASwapBidCreationRequest: XDREncodable {
  public var baseBalance: BalanceID
  public var amount: Uint64
  public var creatorDetails: Longstring
  public var quoteAssets: [ASwapBidQuoteAsset]
  public var ext: ASwapBidCreationRequestExt

  public init(
      baseBalance: BalanceID,
      amount: Uint64,
      creatorDetails: Longstring,
      quoteAssets: [ASwapBidQuoteAsset],
      ext: ASwapBidCreationRequestExt) {

    self.baseBalance = baseBalance
    self.amount = amount
    self.creatorDetails = creatorDetails
    self.quoteAssets = quoteAssets
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.baseBalance.toXDR())
    xdr.append(self.amount.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.quoteAssets.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ASwapBidCreationRequestExt: XDRDiscriminatedUnion {
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

// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Extended result of a Review Request operation containing details specific to certain request types
//  struct ExtendedResult {
//      //: Indicates whether or not the request that is being reviewed was applied
//      bool fulfilled;
//      //: typeExt is used to pass ReviewableRequestType along with details specific to a request type
//      union switch(ReviewableRequestType requestType) {
//      case CREATE_SALE:
//          SaleExtended saleExtended;
//      case NONE:
//          void;
//      case CREATE_ATOMIC_SWAP_BID:
//          AtomicSwapBidExtended atomicSwapBidExtended;
//      case CREATE_ATOMIC_SWAP_ASK:
//          AtomicSwapAskExtended atomicSwapAskExtended;
//      case CREATE_POLL:
//          CreatePollExtended createPoll;
//      } typeExt;
//  
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ExtendedResult: XDREncodable {
  public var fulfilled: Bool
  public var typeExt: ExtendedResultTypeExt
  public var ext: ExtendedResultExt

  public init(
      fulfilled: Bool,
      typeExt: ExtendedResultTypeExt,
      ext: ExtendedResultExt) {

    self.fulfilled = fulfilled
    self.typeExt = typeExt
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.fulfilled.toXDR())
    xdr.append(self.typeExt.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ExtendedResultTypeExt: XDRDiscriminatedUnion {
    case createSale(SaleExtended)
    case none
    case createAtomicSwapBid(AtomicSwapBidExtended)
    case createAtomicSwapAsk(AtomicSwapAskExtended)
    case createPoll(CreatePollExtended)

    public var discriminant: Int32 {
      switch self {
      case .createSale: return ReviewableRequestType.createSale.rawValue
      case .none: return ReviewableRequestType.none.rawValue
      case .createAtomicSwapBid: return ReviewableRequestType.createAtomicSwapBid.rawValue
      case .createAtomicSwapAsk: return ReviewableRequestType.createAtomicSwapAsk.rawValue
      case .createPoll: return ReviewableRequestType.createPoll.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .createSale(let data): xdr.append(data.toXDR())
      case .none: xdr.append(Data())
      case .createAtomicSwapBid(let data): xdr.append(data.toXDR())
      case .createAtomicSwapAsk(let data): xdr.append(data.toXDR())
      case .createPoll(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

  }
  public enum ExtendedResultExt: XDRDiscriminatedUnion {
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

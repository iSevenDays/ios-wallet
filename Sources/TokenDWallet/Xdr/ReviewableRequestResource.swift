// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Describes properties of some reviewable request types that
//  //: can be used to restrict the usage of reviewable requests
//  union ReviewableRequestResource switch (ReviewableRequestType requestType)
//  {
//  case CREATE_SALE:
//      //: is used to restrict the usage of a reviewable request with create_sale type
//      struct
//      {
//          //: type of sale
//          uint64 type;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } createSale;
//  case CREATE_ISSUANCE:
//      //: is used to restrict the usage of a reviewable request with create_issuance type
//      struct
//      {
//          //: code of asset
//          AssetCode assetCode;
//          //: type of asset
//          uint64 assetType;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } createIssuance;
//  case CREATE_WITHDRAW:
//      //: is used to restrict the usage of a reviewable request with create_withdraw type
//      struct
//      {
//          //: code of asset
//          AssetCode assetCode;
//          //: type of asset
//          uint64 assetType;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } createWithdraw;
//  case CREATE_ATOMIC_SWAP_ASK:
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      case ATOMIC_SWAP_RETURNING:
//          //: is used to restrict the usage of a reviewable request with create_atomic_swap_ask type
//          struct
//          {
//              //: code of asset
//              AssetCode assetCode;
//              //: type of asset
//              uint64 assetType;
//  
//              //: reserved for future extension
//              EmptyExt ext;
//          } createAtomicSwapAsk;
//      } createAtomicSwapAskExt;
//  case CREATE_ATOMIC_SWAP_BID:
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      case ATOMIC_SWAP_RETURNING:
//          //: is used to restrict the usage of a reviewable request with create_atomic_swap_bid type
//          struct
//          {
//              //: code of asset
//              AssetCode assetCode;
//              //: type of asset
//              uint64 assetType;
//  
//              //: reserved for future extension
//              EmptyExt ext;
//          } createAtomicSwapBid;
//      } createAtomicSwapBidExt;
//  case CREATE_POLL:
//      //: is used to restrict the creating of a `CREATE_POLL` reviewable request type
//      struct
//      {
//          //: permission type of poll
//          uint32 permissionType;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } createPoll;
//  default:
//      //: reserved for future extension
//      EmptyExt ext;
//  };

//  ===========================================================================
public enum ReviewableRequestResource: XDRDiscriminatedUnion {
  case createSale(ReviewableRequestResourceCreateSale)
  case createIssuance(ReviewableRequestResourceCreateIssuance)
  case createWithdraw(ReviewableRequestResourceCreateWithdraw)
  case createAtomicSwapAsk(ReviewableRequestResourceCreateAtomicSwapAskExt)
  case createAtomicSwapBid(ReviewableRequestResourceCreateAtomicSwapBidExt)
  case createPoll(ReviewableRequestResourceCreatePoll)

  public var discriminant: Int32 {
    switch self {
    case .createSale: return ReviewableRequestType.createSale.rawValue
    case .createIssuance: return ReviewableRequestType.createIssuance.rawValue
    case .createWithdraw: return ReviewableRequestType.createWithdraw.rawValue
    case .createAtomicSwapAsk: return ReviewableRequestType.createAtomicSwapAsk.rawValue
    case .createAtomicSwapBid: return ReviewableRequestType.createAtomicSwapBid.rawValue
    case .createPoll: return ReviewableRequestType.createPoll.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .createSale(let data): xdr.append(data.toXDR())
    case .createIssuance(let data): xdr.append(data.toXDR())
    case .createWithdraw(let data): xdr.append(data.toXDR())
    case .createAtomicSwapAsk(let data): xdr.append(data.toXDR())
    case .createAtomicSwapBid(let data): xdr.append(data.toXDR())
    case .createPoll(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
  public struct ReviewableRequestResourceCreateSale: XDREncodable {
    public var type: Uint64
    public var ext: EmptyExt

    public init(
        type: Uint64,
        ext: EmptyExt) {

      self.type = type
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.type.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct ReviewableRequestResourceCreateIssuance: XDREncodable {
    public var assetCode: AssetCode
    public var assetType: Uint64
    public var ext: EmptyExt

    public init(
        assetCode: AssetCode,
        assetType: Uint64,
        ext: EmptyExt) {

      self.assetCode = assetCode
      self.assetType = assetType
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.assetCode.toXDR())
      xdr.append(self.assetType.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct ReviewableRequestResourceCreateWithdraw: XDREncodable {
    public var assetCode: AssetCode
    public var assetType: Uint64
    public var ext: EmptyExt

    public init(
        assetCode: AssetCode,
        assetType: Uint64,
        ext: EmptyExt) {

      self.assetCode = assetCode
      self.assetType = assetType
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.assetCode.toXDR())
      xdr.append(self.assetType.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public enum ReviewableRequestResourceCreateAtomicSwapAskExt: XDRDiscriminatedUnion {
    case emptyVersion()
    case atomicSwapReturning(ReviewableRequestResourceCreateAtomicSwapAskExtCreateAtomicSwapAsk)

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      case .atomicSwapReturning: return LedgerVersion.atomicSwapReturning.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion(): xdr.append(Data())
      case .atomicSwapReturning(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

    public struct ReviewableRequestResourceCreateAtomicSwapAskExtCreateAtomicSwapAsk: XDREncodable {
      public var assetCode: AssetCode
      public var assetType: Uint64
      public var ext: EmptyExt

      public init(
          assetCode: AssetCode,
          assetType: Uint64,
          ext: EmptyExt) {

        self.assetCode = assetCode
        self.assetType = assetType
        self.ext = ext
      }

      public func toXDR() -> Data {
        var xdr = Data()

        xdr.append(self.assetCode.toXDR())
        xdr.append(self.assetType.toXDR())
        xdr.append(self.ext.toXDR())

        return xdr
      }

    }
  }
  public enum ReviewableRequestResourceCreateAtomicSwapBidExt: XDRDiscriminatedUnion {
    case emptyVersion()
    case atomicSwapReturning(ReviewableRequestResourceCreateAtomicSwapBidExtCreateAtomicSwapBid)

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      case .atomicSwapReturning: return LedgerVersion.atomicSwapReturning.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion(): xdr.append(Data())
      case .atomicSwapReturning(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

    public struct ReviewableRequestResourceCreateAtomicSwapBidExtCreateAtomicSwapBid: XDREncodable {
      public var assetCode: AssetCode
      public var assetType: Uint64
      public var ext: EmptyExt

      public init(
          assetCode: AssetCode,
          assetType: Uint64,
          ext: EmptyExt) {

        self.assetCode = assetCode
        self.assetType = assetType
        self.ext = ext
      }

      public func toXDR() -> Data {
        var xdr = Data()

        xdr.append(self.assetCode.toXDR())
        xdr.append(self.assetType.toXDR())
        xdr.append(self.ext.toXDR())

        return xdr
      }

    }
  }
  public struct ReviewableRequestResourceCreatePoll: XDREncodable {
    public var permissionType: Uint32
    public var ext: EmptyExt

    public init(
        permissionType: Uint32,
        ext: EmptyExt) {

      self.permissionType = permissionType
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.permissionType.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
}

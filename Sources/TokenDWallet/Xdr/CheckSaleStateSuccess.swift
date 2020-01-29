// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of the successful application of CheckSaleState operation
//  struct CheckSaleStateSuccess
//  {
//      //: ID of the sale being checked
//      uint64 saleID;
//      //: Additional information regarding eventual result
//      union switch (CheckSaleStateEffect effect)
//      {
//      case CANCELED:
//          SaleCanceled saleCanceled;
//      case CLOSED:
//          CheckSaleClosedResult saleClosed;
//      case UPDATED:
//          SaleUpdated saleUpdated;
//      }
//      effect;
//       //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//        case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CheckSaleStateSuccess: XDREncodable {
  public var saleID: Uint64
  public var effect: CheckSaleStateSuccessEffect
  public var ext: CheckSaleStateSuccessExt

  public init(
      saleID: Uint64,
      effect: CheckSaleStateSuccessEffect,
      ext: CheckSaleStateSuccessExt) {

    self.saleID = saleID
    self.effect = effect
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.saleID.toXDR())
    xdr.append(self.effect.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CheckSaleStateSuccessEffect: XDRDiscriminatedUnion {
    case canceled(SaleCanceled)
    case closed(CheckSaleClosedResult)
    case updated(SaleUpdated)

    public var discriminant: Int32 {
      switch self {
      case .canceled: return CheckSaleStateEffect.canceled.rawValue
      case .closed: return CheckSaleStateEffect.closed.rawValue
      case .updated: return CheckSaleStateEffect.updated.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .canceled(let data): xdr.append(data.toXDR())
      case .closed(let data): xdr.append(data.toXDR())
      case .updated(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

  }
  public enum CheckSaleStateSuccessExt: XDRDiscriminatedUnion {
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

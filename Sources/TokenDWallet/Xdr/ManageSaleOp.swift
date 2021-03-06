// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: ManageSaleOp is used to cancel a sale, or create a reviewable request which, after approval, will update sale details.
//  struct ManageSaleOp
//  {
//      //: ID of the sale to manage
//      uint64 saleID;
//      //: data is used to pass ManageSaleAction along with required parameters
//      union switch (ManageSaleAction action) {
//      case CREATE_UPDATE_DETAILS_REQUEST:
//          UpdateSaleDetailsData updateSaleDetailsData;
//      case CANCEL:
//          void;
//      } data;
//  
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct ManageSaleOp: XDREncodable {
  public var saleID: Uint64
  public var data: ManageSaleOpData
  public var ext: ManageSaleOpExt

  public init(
      saleID: Uint64,
      data: ManageSaleOpData,
      ext: ManageSaleOpExt) {

    self.saleID = saleID
    self.data = data
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.saleID.toXDR())
    xdr.append(self.data.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ManageSaleOpData: XDRDiscriminatedUnion {
    case createUpdateDetailsRequest(UpdateSaleDetailsData)
    case cancel

    public var discriminant: Int32 {
      switch self {
      case .createUpdateDetailsRequest: return ManageSaleAction.createUpdateDetailsRequest.rawValue
      case .cancel: return ManageSaleAction.cancel.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .createUpdateDetailsRequest(let data): xdr.append(data.toXDR())
      case .cancel: xdr.append(Data())
      }

      return xdr
    }

  }
  public enum ManageSaleOpExt: XDRDiscriminatedUnion {
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

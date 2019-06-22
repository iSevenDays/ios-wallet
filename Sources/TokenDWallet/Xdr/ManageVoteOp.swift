// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: ManageVoteOp is used to create (send) or remove (cancel) vote
//  struct ManageVoteOp
//  {
//      //: `data` is used to pass `ManageVoteAction` with needed params
//      union switch (ManageVoteAction action)
//      {
//      case CREATE:
//          CreateVoteData createData;
//      case REMOVE:
//          RemoveVoteData removeData;
//      }
//      data;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct ManageVoteOp: XDREncodable {
  public var data: ManageVoteOpData
  public var ext: ManageVoteOpExt

  public init(
      data: ManageVoteOpData,
      ext: ManageVoteOpExt) {

    self.data = data
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.data.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ManageVoteOpData: XDRDiscriminatedUnion {
    case create(CreateVoteData)
    case remove(RemoveVoteData)

    public var discriminant: Int32 {
      switch self {
      case .create: return ManageVoteAction.create.rawValue
      case .remove: return ManageVoteAction.remove.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .create(let data): xdr.append(data.toXDR())
      case .remove(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

  }
  public enum ManageVoteOpExt: XDRDiscriminatedUnion {
    case emptyVersion()

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion(): xdr.append(Data())
      }

      return xdr
    }

  }
}
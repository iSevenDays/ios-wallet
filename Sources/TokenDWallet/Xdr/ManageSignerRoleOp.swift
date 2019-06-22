// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: ManageSignerRoleOp is used to create, update or remove a signer role
//  struct ManageSignerRoleOp
//  {
//      //: data is used to pass one of `ManageSignerRoleAction` with required params
//      union switch (ManageSignerRoleAction action)
//      {
//      case CREATE:
//          CreateSignerRoleData createData;
//      case UPDATE:
//          UpdateSignerRoleData updateData;
//      case REMOVE:
//          RemoveSignerRoleData removeData;
//      } data;
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
public struct ManageSignerRoleOp: XDREncodable {
  public var data: ManageSignerRoleOpData
  public var ext: ManageSignerRoleOpExt

  public init(
      data: ManageSignerRoleOpData,
      ext: ManageSignerRoleOpExt) {

    self.data = data
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.data.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ManageSignerRoleOpData: XDRDiscriminatedUnion {
    case create(CreateSignerRoleData)
    case update(UpdateSignerRoleData)
    case remove(RemoveSignerRoleData)

    public var discriminant: Int32 {
      switch self {
      case .create: return ManageSignerRoleAction.create.rawValue
      case .update: return ManageSignerRoleAction.update.rawValue
      case .remove: return ManageSignerRoleAction.remove.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .create(let data): xdr.append(data.toXDR())
      case .update(let data): xdr.append(data.toXDR())
      case .remove(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

  }
  public enum ManageSignerRoleOpExt: XDRDiscriminatedUnion {
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

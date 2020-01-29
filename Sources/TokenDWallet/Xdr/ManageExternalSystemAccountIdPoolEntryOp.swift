// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: ManageExternalSystemAccountIdPoolEntryOp is used to create or remove
//  //: an external system account ID from the external system ID pool
//  struct ManageExternalSystemAccountIdPoolEntryOp
//  {
//      //: `actionInput` is used to pass one of
//      //: `ManageExternalSystemAccountIdPoolEntryAction` with required params
//      union switch (ManageExternalSystemAccountIdPoolEntryAction action)
//      {
//      case CREATE:
//          CreateExternalSystemAccountIdPoolEntryActionInput createExternalSystemAccountIdPoolEntryActionInput;
//      case REMOVE:
//          DeleteExternalSystemAccountIdPoolEntryActionInput deleteExternalSystemAccountIdPoolEntryActionInput;
//      } actionInput;
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
public struct ManageExternalSystemAccountIdPoolEntryOp: XDREncodable {
  public var actionInput: ManageExternalSystemAccountIdPoolEntryOpActionInput
  public var ext: ManageExternalSystemAccountIdPoolEntryOpExt

  public init(
      actionInput: ManageExternalSystemAccountIdPoolEntryOpActionInput,
      ext: ManageExternalSystemAccountIdPoolEntryOpExt) {

    self.actionInput = actionInput
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.actionInput.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ManageExternalSystemAccountIdPoolEntryOpActionInput: XDRDiscriminatedUnion {
    case create(CreateExternalSystemAccountIdPoolEntryActionInput)
    case remove(DeleteExternalSystemAccountIdPoolEntryActionInput)

    public var discriminant: Int32 {
      switch self {
      case .create: return ManageExternalSystemAccountIdPoolEntryAction.create.rawValue
      case .remove: return ManageExternalSystemAccountIdPoolEntryAction.remove.rawValue
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
  public enum ManageExternalSystemAccountIdPoolEntryOpExt: XDRDiscriminatedUnion {
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

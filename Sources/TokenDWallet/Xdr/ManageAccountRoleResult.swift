// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of the operation performed 
//  union ManageAccountRoleResult switch (ManageAccountRoleResultCode code)
//  {
//      case SUCCESS:
//          //: Is used to pass useful params if the operation is successful
//          struct {
//              //: id of the role that was managed
//              uint64 roleID;
//  
//              //: reserved for future use
//              union switch (LedgerVersion v)
//              {
//              case EMPTY_VERSION:
//                  void;
//              }
//              ext;
//          } success;
//      case RULE_ID_DUPLICATION:
//      case NO_SUCH_RULE:
//          //: ID of a rule that was either duplicated or does not exist
//          uint64 ruleID;
//      default:
//          void;
//  };

//  ===========================================================================
public enum ManageAccountRoleResult: XDRDiscriminatedUnion {
  case success(ManageAccountRoleResultSuccess)
  case ruleIdDuplication(Uint64)
  case noSuchRule(Uint64)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageAccountRoleResultCode.success.rawValue
    case .ruleIdDuplication: return ManageAccountRoleResultCode.ruleIdDuplication.rawValue
    case .noSuchRule: return ManageAccountRoleResultCode.noSuchRule.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .success(let data): xdr.append(data.toXDR())
    case .ruleIdDuplication(let data): xdr.append(data.toXDR())
    case .noSuchRule(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
  public struct ManageAccountRoleResultSuccess: XDREncodable {
    public var roleID: Uint64
    public var ext: ManageAccountRoleResultSuccessExt

    public init(
        roleID: Uint64,
        ext: ManageAccountRoleResultSuccessExt) {

      self.roleID = roleID
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.roleID.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

    public enum ManageAccountRoleResultSuccessExt: XDRDiscriminatedUnion {
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
}

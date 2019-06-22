// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of operation applying
//  union ManageAccountRuleResult switch (ManageAccountRuleResultCode code)
//  {
//      case SUCCESS:
//          //: Is used to pass useful params if operation is success
//          struct {
//              //: id of the rule that was managed
//              uint64 ruleID;
//  
//              //: reserved for future use
//              union switch (LedgerVersion v)
//              {
//              case EMPTY_VERSION:
//                  void;
//              }
//              ext;
//          } success;
//      case RULE_IS_USED:
//          //: ids of roles that use the rule that cannot be removed
//          uint64 roleIDs<>;
//      default:
//          void;
//  };

//  ===========================================================================
public enum ManageAccountRuleResult: XDRDiscriminatedUnion {
  case success(ManageAccountRuleResultSuccess)
  case ruleIsUsed([Uint64])

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageAccountRuleResultCode.success.rawValue
    case .ruleIsUsed: return ManageAccountRuleResultCode.ruleIsUsed.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .success(let data): xdr.append(data.toXDR())
    case .ruleIsUsed(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
  public struct ManageAccountRuleResultSuccess: XDREncodable {
    public var ruleID: Uint64
    public var ext: ManageAccountRuleResultSuccessExt

    public init(
        ruleID: Uint64,
        ext: ManageAccountRuleResultSuccessExt) {

      self.ruleID = ruleID
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.ruleID.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

    public enum ManageAccountRuleResultSuccessExt: XDRDiscriminatedUnion {
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
}

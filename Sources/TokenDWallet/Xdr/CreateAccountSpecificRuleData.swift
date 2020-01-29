// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreateAccountSpecificRuleData is used to pass necessary params to create a new account specific rule
//  struct CreateAccountSpecificRuleData
//  {
//      //: ledgerKey is used to specify an entity with primary key that can be used through operations
//      LedgerKey ledgerKey;
//      //: Certain account for which rule is applied, null means rule is global
//      AccountID* accountID;
//      //: True if such rule is deniable, otherwise allows
//      bool forbids;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct CreateAccountSpecificRuleData: XDREncodable {
  public var ledgerKey: LedgerKey
  public var accountID: AccountID?
  public var forbids: Bool
  public var ext: CreateAccountSpecificRuleDataExt

  public init(
      ledgerKey: LedgerKey,
      accountID: AccountID?,
      forbids: Bool,
      ext: CreateAccountSpecificRuleDataExt) {

    self.ledgerKey = ledgerKey
    self.accountID = accountID
    self.forbids = forbids
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.ledgerKey.toXDR())
    xdr.append(self.accountID.toXDR())
    xdr.append(self.forbids.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CreateAccountSpecificRuleDataExt: XDRDiscriminatedUnion {
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

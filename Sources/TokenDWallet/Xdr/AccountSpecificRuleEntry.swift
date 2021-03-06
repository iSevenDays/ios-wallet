// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct AccountSpecificRuleEntry
//  {
//      uint64 id;
//  
//      LedgerKey ledgerKey;
//      AccountID* accountID;
//      bool forbids;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct AccountSpecificRuleEntry: XDREncodable {
  public var id: Uint64
  public var ledgerKey: LedgerKey
  public var accountID: AccountID?
  public var forbids: Bool
  public var ext: AccountSpecificRuleEntryExt

  public init(
      id: Uint64,
      ledgerKey: LedgerKey,
      accountID: AccountID?,
      forbids: Bool,
      ext: AccountSpecificRuleEntryExt) {

    self.id = id
    self.ledgerKey = ledgerKey
    self.accountID = accountID
    self.forbids = forbids
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.id.toXDR())
    xdr.append(self.ledgerKey.toXDR())
    xdr.append(self.accountID.toXDR())
    xdr.append(self.forbids.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum AccountSpecificRuleEntryExt: XDRDiscriminatedUnion {
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

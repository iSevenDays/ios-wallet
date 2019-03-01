// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct LimitsCreateDetails
//  {
//      //: (optional) ID of the account role to which limits would be applied
//      uint64*     accountRole;
//      //: (optional) ID of the account to which limits would be applied
//      AccountID*  accountID;
//      //: Defines an operation type to which limits would be applied. See `enum StatsOpType`
//      StatsOpType statsOpType;
//      //: `AssetCode` defines the asset to which limits would be applied
//      AssetCode   assetCode;
//      //: `isConvertNeeded` indicates whether the asset conversion is needed for the limits entry or not needed.
//      //: If this field is `true` - limits are applied to all balances of the account (to every asset account owns).
//      //: Otherwise limits from particular limits entry are applied only to the balances with `AssetCode` provided by entry.
//      bool        isConvertNeeded;
//  
//      //: daily out limit
//      uint64 dailyOut;
//      //: weekly out limit
//      uint64 weeklyOut;
//      //: monthly out limit
//      uint64 monthlyOut;
//      //: annual out limit
//      uint64 annualOut;
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
public struct LimitsCreateDetails: XDREncodable {
  public var accountRole: Uint64?
  public var accountID: AccountID?
  public var statsOpType: StatsOpType
  public var assetCode: AssetCode
  public var isConvertNeeded: Bool
  public var dailyOut: Uint64
  public var weeklyOut: Uint64
  public var monthlyOut: Uint64
  public var annualOut: Uint64
  public var ext: LimitsCreateDetailsExt

  public init(
      accountRole: Uint64?,
      accountID: AccountID?,
      statsOpType: StatsOpType,
      assetCode: AssetCode,
      isConvertNeeded: Bool,
      dailyOut: Uint64,
      weeklyOut: Uint64,
      monthlyOut: Uint64,
      annualOut: Uint64,
      ext: LimitsCreateDetailsExt) {

    self.accountRole = accountRole
    self.accountID = accountID
    self.statsOpType = statsOpType
    self.assetCode = assetCode
    self.isConvertNeeded = isConvertNeeded
    self.dailyOut = dailyOut
    self.weeklyOut = weeklyOut
    self.monthlyOut = monthlyOut
    self.annualOut = annualOut
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.accountRole.toXDR())
    xdr.append(self.accountID.toXDR())
    xdr.append(self.statsOpType.toXDR())
    xdr.append(self.assetCode.toXDR())
    xdr.append(self.isConvertNeeded.toXDR())
    xdr.append(self.dailyOut.toXDR())
    xdr.append(self.weeklyOut.toXDR())
    xdr.append(self.monthlyOut.toXDR())
    xdr.append(self.annualOut.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum LimitsCreateDetailsExt: XDRDiscriminatedUnion {
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
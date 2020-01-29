// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: RemoveSignerRuleData is used to pass necessary params to remove existing signer rule
//  struct RemoveSignerRuleData
//  {
//      //: Identifier of an existing signer rule
//      uint64 ruleID;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct RemoveSignerRuleData: XDREncodable {
  public var ruleID: Uint64
  public var ext: RemoveSignerRuleDataExt

  public init(
      ruleID: Uint64,
      ext: RemoveSignerRuleDataExt) {

    self.ruleID = ruleID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.ruleID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum RemoveSignerRuleDataExt: XDRDiscriminatedUnion {
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

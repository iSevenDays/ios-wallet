// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Review details of a Limits Update request
//  struct LimitsUpdateDetails { 
//      //: Limits entry containing new limits to set 
//      LimitsV2Entry newLimitsV2;
//  
//      //:reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct LimitsUpdateDetails: XDREncodable {
  public var newLimitsV2: LimitsV2Entry
  public var ext: LimitsUpdateDetailsExt

  public init(
      newLimitsV2: LimitsV2Entry,
      ext: LimitsUpdateDetailsExt) {

    self.newLimitsV2 = newLimitsV2
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.newLimitsV2.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum LimitsUpdateDetailsExt: XDRDiscriminatedUnion {
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

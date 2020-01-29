// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct UpdatePollEndTimeData
//  {
//      uint64 newEndTime;
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
public struct UpdatePollEndTimeData: XDREncodable {
  public var newEndTime: Uint64
  public var ext: UpdatePollEndTimeDataExt

  public init(
      newEndTime: Uint64,
      ext: UpdatePollEndTimeDataExt) {

    self.newEndTime = newEndTime
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.newEndTime.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum UpdatePollEndTimeDataExt: XDRDiscriminatedUnion {
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

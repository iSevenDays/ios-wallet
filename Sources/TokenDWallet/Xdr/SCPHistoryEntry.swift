// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union SCPHistoryEntry switch (LedgerVersion v)
//  {
//  case EMPTY_VERSION:
//      SCPHistoryEntryV0 v0;
//  };

//  ===========================================================================
public enum SCPHistoryEntry: XDRDiscriminatedUnion {
  case emptyVersion(SCPHistoryEntryV0)

  public var discriminant: Int32 {
    switch self {
    case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .emptyVersion(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
}
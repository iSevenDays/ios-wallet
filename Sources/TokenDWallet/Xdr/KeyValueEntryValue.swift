// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: `KeyValueEntryValue` represents the value based on given `KeyValueEntryType`
//      union KeyValueEntryValue switch (KeyValueEntryType type)
//      {
//          case UINT32:
//              uint32 ui32Value;
//          case STRING:
//              string stringValue<>;
//          case UINT64:
//              uint64 ui64Value;
//      };

//  ===========================================================================
public enum KeyValueEntryValue: XDRDiscriminatedUnion {
  case uint32(Uint32)
  case string(String)
  case uint64(Uint64)

  public var discriminant: Int32 {
    switch self {
    case .uint32: return KeyValueEntryType.uint32.rawValue
    case .string: return KeyValueEntryType.string.rawValue
    case .uint64: return KeyValueEntryType.uint64.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .uint32(let data): xdr.append(data.toXDR())
    case .string(let data): xdr.append(data.toXDR())
    case .uint64(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
}

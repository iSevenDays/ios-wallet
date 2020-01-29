// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: `KeyValueEntry` is an entry used to store key mapped values
//      struct KeyValueEntry
//      {
//          //: String value that must be unique among other keys for kev-value pairs
//          longstring key;
//  
//          //: Value that corresponds to particular key (depending on `KeyValueEntryType`, 
//          //: the value can be either uint32, or uint64, or string)
//          KeyValueEntryValue value;
//  
//          //: reserved for future use
//          union switch (LedgerVersion v)
//          {
//              case EMPTY_VERSION:
//                  void;
//          }
//          ext;
//      };

//  ===========================================================================
public struct KeyValueEntry: XDREncodable {
  public var key: Longstring
  public var value: KeyValueEntryValue
  public var ext: KeyValueEntryExt

  public init(
      key: Longstring,
      value: KeyValueEntryValue,
      ext: KeyValueEntryExt) {

    self.key = key
    self.value = value
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.key.toXDR())
    xdr.append(self.value.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum KeyValueEntryExt: XDRDiscriminatedUnion {
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

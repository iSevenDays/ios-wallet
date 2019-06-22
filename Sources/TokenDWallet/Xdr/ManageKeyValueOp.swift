// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: `ManageKeyValueOp` is used to create the manage key-value operation which, if applied successfully, will update the key-value entry present in the system
//      struct ManageKeyValueOp
//      {
//          //: `key` is the key for KeyValueEntry
//          longstring key;
//          //: `action` defines an action applied to the KeyValue based on given ManageKVAction
//          //: * Action `PUT` stores new value for a particular key
//          //: * Action `REMOVE` removes the value by a particular key
//          union switch(ManageKVAction action)
//          {
//              case PUT:
//                   KeyValueEntryValue value;
//              case REMOVE:
//                  void;
//          }
//          action;
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
public struct ManageKeyValueOp: XDREncodable {
  public var key: Longstring
  public var action: ManageKeyValueOpAction
  public var ext: ManageKeyValueOpExt

  public init(
      key: Longstring,
      action: ManageKeyValueOpAction,
      ext: ManageKeyValueOpExt) {

    self.key = key
    self.action = action
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.key.toXDR())
    xdr.append(self.action.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ManageKeyValueOpAction: XDRDiscriminatedUnion {
    case put(KeyValueEntryValue)
    case remove()

    public var discriminant: Int32 {
      switch self {
      case .put: return ManageKVAction.put.rawValue
      case .remove: return ManageKVAction.remove.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .put(let data): xdr.append(data.toXDR())
      case .remove(): xdr.append(Data())
      }

      return xdr
    }

  }
  public enum ManageKeyValueOpExt: XDRDiscriminatedUnion {
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

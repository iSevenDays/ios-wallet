// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct Curve25519Secret
//  {
//          opaque key[32];
//  };

//  ===========================================================================
public struct Curve25519Secret: XDREncodable {
  public var key: XDRDataFixed32

  public init(
      key: XDRDataFixed32) {

    self.key = key
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.key.toXDR())

    return xdr
  }
}

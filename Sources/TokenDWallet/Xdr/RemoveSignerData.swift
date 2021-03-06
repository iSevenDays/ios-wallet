// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: RemoveSignerData is used to pass necessary data to remove a signer
//  struct RemoveSignerData
//  {
//      //: Public key of an existing signer
//      PublicKey publicKey;
//  
//      //: reserved for future extension
//      EmptyExt ext;
//  };

//  ===========================================================================
public struct RemoveSignerData: XDREncodable {
  public var publicKey: PublicKey
  public var ext: EmptyExt

  public init(
      publicKey: PublicKey,
      ext: EmptyExt) {

    self.publicKey = publicKey
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.publicKey.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }
}

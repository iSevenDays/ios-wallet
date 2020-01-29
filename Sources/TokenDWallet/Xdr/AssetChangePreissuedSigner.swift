// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: AssetChangePreissuedSigner is used to update a pre issued asset signer
//  struct AssetChangePreissuedSigner
//  {
//      //: code of an asset to update
//      AssetCode code;
//      //: Public key of a signer that will be the new pre issuer
//      AccountID accountID;
//      //: Content signature of a pre issuer signer
//      //: Content equals hash of `<code>:<accountID>`
//      DecoratedSignature signature;
//  
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct AssetChangePreissuedSigner: XDREncodable {
  public var code: AssetCode
  public var accountID: AccountID
  public var signature: DecoratedSignature
  public var ext: AssetChangePreissuedSignerExt

  public init(
      code: AssetCode,
      accountID: AccountID,
      signature: DecoratedSignature,
      ext: AssetChangePreissuedSignerExt) {

    self.code = code
    self.accountID = accountID
    self.signature = signature
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.code.toXDR())
    xdr.append(self.accountID.toXDR())
    xdr.append(self.signature.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum AssetChangePreissuedSignerExt: XDRDiscriminatedUnion {
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

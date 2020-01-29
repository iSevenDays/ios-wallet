// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: StampSuccess is used to pass saved ledger hash and license hash
//  struct StampSuccess {
//      //: ledger hash saved into a database
//      Hash ledgerHash;
//  
//      //: current license hash
//      Hash licenseHash;
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
public struct StampSuccess: XDREncodable {
  public var ledgerHash: Hash
  public var licenseHash: Hash
  public var ext: StampSuccessExt

  public init(
      ledgerHash: Hash,
      licenseHash: Hash,
      ext: StampSuccessExt) {

    self.ledgerHash = ledgerHash
    self.licenseHash = licenseHash
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.ledgerHash.toXDR())
    xdr.append(self.licenseHash.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum StampSuccessExt: XDRDiscriminatedUnion {
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

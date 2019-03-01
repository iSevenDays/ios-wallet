// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct LimitsUpdateRequest
//  {
//      //: Arbitrary stringified JSON object that can be used to attach data to be reviewed by the admin
//      longstring creatorDetails;
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
public struct LimitsUpdateRequest: XDREncodable {
  public var creatorDetails: Longstring
  public var ext: LimitsUpdateRequestExt

  public init(
      creatorDetails: Longstring,
      ext: LimitsUpdateRequestExt) {

    self.creatorDetails = creatorDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum LimitsUpdateRequestExt: XDRDiscriminatedUnion {
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
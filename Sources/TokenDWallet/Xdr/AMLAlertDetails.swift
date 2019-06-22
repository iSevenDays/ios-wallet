// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Details of AML Alert 
//  struct AMLAlertDetails {
//      //: Comment on reason of AML Alert
//      string comment<>;
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct AMLAlertDetails: XDREncodable {
  public var comment: String
  public var ext: AMLAlertDetailsExt

  public init(
      comment: String,
      ext: AMLAlertDetailsExt) {

    self.comment = comment
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.comment.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum AMLAlertDetailsExt: XDRDiscriminatedUnion {
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

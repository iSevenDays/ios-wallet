// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct TransactionResultSet
//  {
//      TransactionResultPair results<>;
//  };

//  ===========================================================================
public struct TransactionResultSet: XDREncodable {
  public var results: [TransactionResultPair]

  public init(
      results: [TransactionResultPair]) {

    self.results = results
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.results.toXDR())

    return xdr
  }
}

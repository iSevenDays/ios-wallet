// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct SCPQuorumSet
//  {
//      uint32 threshold;
//      PublicKey validators<>;
//      SCPQuorumSet innerSets<>;
//  };

//  ===========================================================================
public struct SCPQuorumSet: XDREncodable {
  public var threshold: Uint32
  public var validators: [PublicKey]
  public var innerSets: [SCPQuorumSet]

  public init(
      threshold: Uint32,
      validators: [PublicKey],
      innerSets: [SCPQuorumSet]) {

    self.threshold = threshold
    self.validators = validators
    self.innerSets = innerSets
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.threshold.toXDR())
    xdr.append(self.validators.toXDR())
    xdr.append(self.innerSets.toXDR())

    return xdr
  }
}

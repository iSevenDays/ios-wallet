// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreateKYCRecoveryRequestOp to create KYC recovery request and set new signers for account
//  struct CreateKYCRecoveryRequestOp
//  {
//      //: ID of a reviewable request. If set 0, request is created, else - request is updated
//      uint64 requestID;
//      //: Account for which signers will be set
//      AccountID targetAccount;
//      //: New signers to set
//      UpdateSignerData signersData<>;
//  
//       //: Arbitrary stringified json object that can be used to attach data to be reviewed by an admin
//      longstring creatorDetails; // details set by requester
//  
//      //: (optional) Bit mask whose flags must be cleared in order for KYC recovery request to be approved, which will be used by key `create_kyc_recovery_tasks`
//      //: instead of key-value
//      uint32* allTasks;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct CreateKYCRecoveryRequestOp: XDREncodable {
  public var requestID: Uint64
  public var targetAccount: AccountID
  public var signersData: [UpdateSignerData]
  public var creatorDetails: Longstring
  public var allTasks: Uint32?
  public var ext: CreateKYCRecoveryRequestOpExt

  public init(
      requestID: Uint64,
      targetAccount: AccountID,
      signersData: [UpdateSignerData],
      creatorDetails: Longstring,
      allTasks: Uint32?,
      ext: CreateKYCRecoveryRequestOpExt) {

    self.requestID = requestID
    self.targetAccount = targetAccount
    self.signersData = signersData
    self.creatorDetails = creatorDetails
    self.allTasks = allTasks
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.targetAccount.toXDR())
    xdr.append(self.signersData.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.allTasks.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CreateKYCRecoveryRequestOpExt: XDRDiscriminatedUnion {
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

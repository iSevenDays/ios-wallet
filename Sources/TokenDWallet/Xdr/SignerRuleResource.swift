// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Describes properties of some entries that can be used to restrict the usage of entries
//  union SignerRuleResource switch (LedgerEntryType type)
//  {
//  case REVIEWABLE_REQUEST:
//      //: Describes properties that are equal to managed reviewable request entry fields
//      struct
//      {
//          //: Describes properties of some reviewable request types that
//          //: can be used to restrict the usage of reviewable requests
//          ReviewableRequestResource details;
//  
//          //: Bit mask of tasks that is allowed to add to reviewable request pending tasks
//          uint64 tasksToAdd;
//          //: Bit mask of tasks that is allowed to remove from reviewable request pending tasks
//          uint64 tasksToRemove;
//          //: Bit mask of tasks that is allowed to use as reviewable request pending tasks
//          uint64 allTasks;
//  
//          EmptyExt ext;
//      } reviewableRequest;
//  case ASSET:
//      //: Describes properties that are equal to managed asset entry fields
//      struct
//      {
//          AssetCode assetCode;
//          uint64 assetType;
//  
//          EmptyExt ext;
//      } asset;
//  case ANY:
//      void;
//  case OFFER_ENTRY:
//      //: Describes properties that are equal to managed offer entry fields and their properties
//      struct
//      {
//          //: type of base asset
//          uint64 baseAssetType;
//          //: type of quote asset
//          uint64 quoteAssetType;
//  
//          //: code of base asset
//          AssetCode baseAssetCode;
//          //: code of quote asset
//          AssetCode quoteAssetCode;
//  
//          bool isBuy;
//  
//          EmptyExt ext;
//      } offer;
//  case SALE:
//      //: Describes properties that are equal to managed offer entry fields
//      struct
//      {
//          uint64 saleID;
//          uint64 saleType;
//  
//          EmptyExt ext;
//      } sale;
//  case ATOMIC_SWAP_ASK:
//      struct
//      {
//          uint64 assetType;
//          AssetCode assetCode;
//  
//          EmptyExt ext;
//      } atomicSwapAsk;
//  case SIGNER_RULE:
//      //: Describes properties that are equal to managed signer rule entry fields
//      struct
//      {
//          bool isDefault;
//  
//          EmptyExt ext;
//      } signerRule;
//  case SIGNER_ROLE:
//      //: Describes properties that are equal to managed signer role entry fields
//      struct
//      {
//          //: For signer role creating resource will be triggered if `roleID` equals `0`
//          uint64 roleID;
//  
//          EmptyExt ext;
//      } signerRole;
//  case SIGNER:
//      //: Describes properties that are equal to managed signer entry fields
//      struct
//      {
//          uint64 roleID;
//  
//          EmptyExt ext;
//      } signer;
//  case KEY_VALUE:
//      //: Describes properties that are equal to managed key value entry fields
//      struct
//      {
//          //: prefix of key
//          longstring keyPrefix;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } keyValue;
//  case POLL:
//      struct
//      {
//          //: ID of the poll
//          uint64 pollID;
//  
//          //: permission type of poll
//          uint32 permissionType;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } poll;
//  case VOTE:
//      struct
//      {
//          //: ID of the poll
//          uint64 pollID;
//  
//          //: permission type of poll
//          uint32 permissionType;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } vote;
//  case INITIATE_KYC_RECOVERY:
//      struct
//      {
//          //: Role id
//          uint64 roleID;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } initiateKYCRecovery;
//  case ACCOUNT_SPECIFIC_RULE:
//      //: reserved for future extension
//      union switch(LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      case ADD_ACC_SPECIFIC_RULE_RESOURCE:
//          struct
//          {
//              //: Describes properties of some ledger key that
//              //: can be used to restrict the usage of account specific rules
//              LedgerKey ledgerKey;
//  
//              //: reserved for future extension
//              EmptyExt ext;
//          } accountSpecificRule;
//      } accountSpecificRuleExt;
//  default:
//      //: reserved for future extension
//      EmptyExt ext;
//  };

//  ===========================================================================
public enum SignerRuleResource: XDRDiscriminatedUnion {
  case reviewableRequest(SignerRuleResourceReviewableRequest)
  case asset(SignerRuleResourceAsset)
  case any
  case offerEntry(SignerRuleResourceOffer)
  case sale(SignerRuleResourceSale)
  case atomicSwapAsk(SignerRuleResourceAtomicSwapAsk)
  case signerRule(SignerRuleResourceSignerRule)
  case signerRole(SignerRuleResourceSignerRole)
  case signer(SignerRuleResourceSigner)
  case keyValue(SignerRuleResourceKeyValue)
  case poll(SignerRuleResourcePoll)
  case vote(SignerRuleResourceVote)
  case initiateKycRecovery(SignerRuleResourceInitiateKYCRecovery)
  case accountSpecificRule(SignerRuleResourceAccountSpecificRuleExt)

  public var discriminant: Int32 {
    switch self {
    case .reviewableRequest: return LedgerEntryType.reviewableRequest.rawValue
    case .asset: return LedgerEntryType.asset.rawValue
    case .any: return LedgerEntryType.any.rawValue
    case .offerEntry: return LedgerEntryType.offerEntry.rawValue
    case .sale: return LedgerEntryType.sale.rawValue
    case .atomicSwapAsk: return LedgerEntryType.atomicSwapAsk.rawValue
    case .signerRule: return LedgerEntryType.signerRule.rawValue
    case .signerRole: return LedgerEntryType.signerRole.rawValue
    case .signer: return LedgerEntryType.signer.rawValue
    case .keyValue: return LedgerEntryType.keyValue.rawValue
    case .poll: return LedgerEntryType.poll.rawValue
    case .vote: return LedgerEntryType.vote.rawValue
    case .initiateKycRecovery: return LedgerEntryType.initiateKycRecovery.rawValue
    case .accountSpecificRule: return LedgerEntryType.accountSpecificRule.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .reviewableRequest(let data): xdr.append(data.toXDR())
    case .asset(let data): xdr.append(data.toXDR())
    case .any: xdr.append(Data())
    case .offerEntry(let data): xdr.append(data.toXDR())
    case .sale(let data): xdr.append(data.toXDR())
    case .atomicSwapAsk(let data): xdr.append(data.toXDR())
    case .signerRule(let data): xdr.append(data.toXDR())
    case .signerRole(let data): xdr.append(data.toXDR())
    case .signer(let data): xdr.append(data.toXDR())
    case .keyValue(let data): xdr.append(data.toXDR())
    case .poll(let data): xdr.append(data.toXDR())
    case .vote(let data): xdr.append(data.toXDR())
    case .initiateKycRecovery(let data): xdr.append(data.toXDR())
    case .accountSpecificRule(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
  public struct SignerRuleResourceReviewableRequest: XDREncodable {
    public var details: ReviewableRequestResource
    public var tasksToAdd: Uint64
    public var tasksToRemove: Uint64
    public var allTasks: Uint64
    public var ext: EmptyExt

    public init(
        details: ReviewableRequestResource,
        tasksToAdd: Uint64,
        tasksToRemove: Uint64,
        allTasks: Uint64,
        ext: EmptyExt) {

      self.details = details
      self.tasksToAdd = tasksToAdd
      self.tasksToRemove = tasksToRemove
      self.allTasks = allTasks
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.details.toXDR())
      xdr.append(self.tasksToAdd.toXDR())
      xdr.append(self.tasksToRemove.toXDR())
      xdr.append(self.allTasks.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourceAsset: XDREncodable {
    public var assetCode: AssetCode
    public var assetType: Uint64
    public var ext: EmptyExt

    public init(
        assetCode: AssetCode,
        assetType: Uint64,
        ext: EmptyExt) {

      self.assetCode = assetCode
      self.assetType = assetType
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.assetCode.toXDR())
      xdr.append(self.assetType.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourceOffer: XDREncodable {
    public var baseAssetType: Uint64
    public var quoteAssetType: Uint64
    public var baseAssetCode: AssetCode
    public var quoteAssetCode: AssetCode
    public var isBuy: Bool
    public var ext: EmptyExt

    public init(
        baseAssetType: Uint64,
        quoteAssetType: Uint64,
        baseAssetCode: AssetCode,
        quoteAssetCode: AssetCode,
        isBuy: Bool,
        ext: EmptyExt) {

      self.baseAssetType = baseAssetType
      self.quoteAssetType = quoteAssetType
      self.baseAssetCode = baseAssetCode
      self.quoteAssetCode = quoteAssetCode
      self.isBuy = isBuy
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.baseAssetType.toXDR())
      xdr.append(self.quoteAssetType.toXDR())
      xdr.append(self.baseAssetCode.toXDR())
      xdr.append(self.quoteAssetCode.toXDR())
      xdr.append(self.isBuy.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourceSale: XDREncodable {
    public var saleID: Uint64
    public var saleType: Uint64
    public var ext: EmptyExt

    public init(
        saleID: Uint64,
        saleType: Uint64,
        ext: EmptyExt) {

      self.saleID = saleID
      self.saleType = saleType
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.saleID.toXDR())
      xdr.append(self.saleType.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourceAtomicSwapAsk: XDREncodable {
    public var assetType: Uint64
    public var assetCode: AssetCode
    public var ext: EmptyExt

    public init(
        assetType: Uint64,
        assetCode: AssetCode,
        ext: EmptyExt) {

      self.assetType = assetType
      self.assetCode = assetCode
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.assetType.toXDR())
      xdr.append(self.assetCode.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourceSignerRule: XDREncodable {
    public var isDefault: Bool
    public var ext: EmptyExt

    public init(
        isDefault: Bool,
        ext: EmptyExt) {

      self.isDefault = isDefault
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.isDefault.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourceSignerRole: XDREncodable {
    public var roleID: Uint64
    public var ext: EmptyExt

    public init(
        roleID: Uint64,
        ext: EmptyExt) {

      self.roleID = roleID
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.roleID.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourceSigner: XDREncodable {
    public var roleID: Uint64
    public var ext: EmptyExt

    public init(
        roleID: Uint64,
        ext: EmptyExt) {

      self.roleID = roleID
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.roleID.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourceKeyValue: XDREncodable {
    public var keyPrefix: Longstring
    public var ext: EmptyExt

    public init(
        keyPrefix: Longstring,
        ext: EmptyExt) {

      self.keyPrefix = keyPrefix
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.keyPrefix.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourcePoll: XDREncodable {
    public var pollID: Uint64
    public var permissionType: Uint32
    public var ext: EmptyExt

    public init(
        pollID: Uint64,
        permissionType: Uint32,
        ext: EmptyExt) {

      self.pollID = pollID
      self.permissionType = permissionType
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.pollID.toXDR())
      xdr.append(self.permissionType.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourceVote: XDREncodable {
    public var pollID: Uint64
    public var permissionType: Uint32
    public var ext: EmptyExt

    public init(
        pollID: Uint64,
        permissionType: Uint32,
        ext: EmptyExt) {

      self.pollID = pollID
      self.permissionType = permissionType
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.pollID.toXDR())
      xdr.append(self.permissionType.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct SignerRuleResourceInitiateKYCRecovery: XDREncodable {
    public var roleID: Uint64
    public var ext: EmptyExt

    public init(
        roleID: Uint64,
        ext: EmptyExt) {

      self.roleID = roleID
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.roleID.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public enum SignerRuleResourceAccountSpecificRuleExt: XDRDiscriminatedUnion {
    case emptyVersion
    case addAccSpecificRuleResource(SignerRuleResourceAccountSpecificRuleExtAccountSpecificRule)

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      case .addAccSpecificRuleResource: return LedgerVersion.addAccSpecificRuleResource.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion: xdr.append(Data())
      case .addAccSpecificRuleResource(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

    public struct SignerRuleResourceAccountSpecificRuleExtAccountSpecificRule: XDREncodable {
      public var ledgerKey: LedgerKey
      public var ext: EmptyExt

      public init(
          ledgerKey: LedgerKey,
          ext: EmptyExt) {

        self.ledgerKey = ledgerKey
        self.ext = ext
      }

      public func toXDR() -> Data {
        var xdr = Data()

        xdr.append(self.ledgerKey.toXDR())
        xdr.append(self.ext.toXDR())

        return xdr
      }

    }
  }
}

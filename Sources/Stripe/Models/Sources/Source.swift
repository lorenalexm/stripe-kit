//
//  Source.swift
//  Stripe
//
//  Created by Anthony Castelli on 4/15/17.
//
//

import Foundation

/**
 Source object
 https://stripe.com/docs/api/curl#source_object
 */

public protocol Source {
    associatedtype R: Receiver
    associatedtype O: Owner
    associatedtype C: Card
    
    var id: String? { get }
    var object: String? { get }
    var amount: Int? { get }
    var clientSecret: String? { get }
    var created: Date? { get }
    var currency: StripeCurrency? { get }
    var flow: Flow? { get }
    var livemode: Bool? { get }
    var metadata: [String: String]? { get }
    var owner: O? { get }
    var receiver: R? { get }
    var redirect: SourceRedirect? { get }
    var statementDescriptor: String? { get }
    var status: StripeStatus? { get }
    var type: SourceType? { get }
    var usage: String? { get }
    var card: C? { get }
    var threeDSecure: ThreeDSecure? { get }
    var giropay: Giropay? { get }
    var sepaDebit: SepaDebit? { get }
    var ideal: iDEAL? { get }
    var sofort: SOFORT? { get }
    var bancontact: Bancontact? { get }
    var alipay: Alipay? { get }
    var p24: P24? { get }
    // TODO: - Add multibanco, EPS and ACHCreditTransfer
    // https://stripe.com/docs/sources
}

public struct StripeSource: Source, StripeModel {
    public var id: String?
    public var object: String?
    public var amount: Int?
    public var clientSecret: String?
    public var created: Date?
    public var currency: StripeCurrency?
    public var flow: Flow?
    public var livemode: Bool?
    public var metadata: [String: String]?
    public var owner: StripeOwner?
    public var receiver: StripeReceiver?
    public var redirect: SourceRedirect?
    public var statementDescriptor: String?
    public var status: StripeStatus?
    public var type: SourceType?
    public var usage: String?
    public var card: StripeCard?
    public var threeDSecure: ThreeDSecure?
    public var giropay: Giropay?
    public var sepaDebit: SepaDebit?
    public var ideal: iDEAL?
    public var sofort: SOFORT?
    public var bancontact: Bancontact?
    public var alipay: Alipay?
    public var p24: P24?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        object = try container.decodeIfPresent(String.self, forKey: .object)
        amount = try container.decodeIfPresent(Int.self, forKey: .amount)
        clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
        created = try container.decodeIfPresent(Date.self, forKey: .created)
        currency = try container.decodeIfPresent(StripeCurrency.self, forKey: .currency)
        flow = try container.decodeIfPresent(Flow.self, forKey: .flow)
        livemode = try container.decodeIfPresent(Bool.self, forKey: .livemode)
        metadata = try container.decodeIfPresent([String: String].self, forKey: .metadata)
        owner = try container.decodeIfPresent(StripeOwner.self, forKey: .owner)
        receiver = try container.decodeIfPresent(StripeReceiver.self, forKey: .receiver)
        redirect = try container.decodeIfPresent(SourceRedirect.self, forKey: .redirect)
        statementDescriptor = try container.decodeIfPresent(String.self, forKey: .statementDescriptor)
        status = try container.decodeIfPresent(StripeStatus.self, forKey: .status)
        usage = try container.decodeIfPresent(String.self, forKey: .usage)
        
        type = try container.decodeIfPresent(SourceType.self, forKey: .type)
        
        switch type! {
        case .card:
            card = try container.decodeIfPresent(StripeCard.self, forKey: .card)

        case .threeDSecure:
            threeDSecure = try container.decodeIfPresent(ThreeDSecure.self, forKey: .threeDSecure)
            
        case .giropay:
            giropay = try container.decodeIfPresent(Giropay.self, forKey: .giropay)
            
        case .sepaDebit:
            sepaDebit = try container.decodeIfPresent(SepaDebit.self, forKey: .sepaDebit)
            
        case .ideal:
            ideal = try container.decodeIfPresent(iDEAL.self, forKey: .ideal)
            
        case .sofort:
            sofort = try container.decodeIfPresent(SOFORT.self, forKey: .sofort)
            
        case .bancontact:
            bancontact = try container.decodeIfPresent(Bancontact.self, forKey: .bancontact)
            
        case .alipay:
            alipay = try container.decodeIfPresent(Alipay.self, forKey: .alipay)
            
        case .p24:
            p24 = try container.decodeIfPresent(P24.self, forKey: .p24)
        }
    }
}

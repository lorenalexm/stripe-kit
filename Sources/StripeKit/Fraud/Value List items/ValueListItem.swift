//
//  ValueListItem.swift
//  Stripe
//
//  Created by Andrew Edwards on 3/30/19.
//

import Foundation

/// The [Value List Item](https://stripe.com/docs/api/radar/value_list_items).
public struct StripeValueListItem: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// The name or email address of the user who added this item to the value list.
    public var createdBy: String?
    /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    public var livemode: Bool?
    /// The value of the item.
    public var value: String?
    /// The identifier of the value list this item belongs to.
    public var valueList: String?
}

public struct StripeValueListItemList: Codable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [StripeValueListItem]?
}

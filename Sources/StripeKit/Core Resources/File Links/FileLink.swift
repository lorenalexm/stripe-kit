//
//  FileLink.swift
//  Stripe
//
//  Created by Andrew Edwards on 9/14/18.
//

import Foundation

/// To share the contents of a File object with non-Stripe users, you can create a FileLink. FileLinks contain a URL that can be used to retrieve the contents of the file without authentication.
public struct StripeFileLink: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// Whether this link is already expired.
    public var expired: Bool?
    /// Time at which the link expires.
    public var expiresAt: Date?
    /// The file object this link points to.
    @Expandable<StripeFile> public var file: String?
    /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    public var livemode: Bool?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// The publicly accessible URL to download the file.
    public var url: String?
}

public struct StripeFileLinkList: Codable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [StripeFileLink]?
}

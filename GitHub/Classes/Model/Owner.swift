//
//  Owner.swift
//  Sweeft
//
//  Created by Mathias Quintero on 9/27/17.
//

import Foundation

public enum Owner: Codable {
    case user(User)
    case organization(Organization)
    
    public enum CodingKeys: String, CodingKey {
        case type
    }
    
    enum `Type`: String, Codable {
        case user = "User"
        case organization = "Organization"
    }
    
}

extension Owner {
    
    private var type: Type {
        switch self {
        case .user:
            return .user
        case .organization:
            return .organization
        }
    }
    
    public init(from decoder: Decoder) throws {
        
        switch try decoder.container(keyedBy: CodingKeys.self).decode(Type.self, forKey: .type) {
            
        case .user:
            self = .user(try User(from: decoder))
            
        case .organization:
            self = .organization(try Organization(from: decoder))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        switch self {
        case .user(let user):
            try user.encode(to: encoder)
        case .organization(let organization):
            try organization.encode(to: encoder)
        }
        var containter = encoder.container(keyedBy: CodingKeys.self)
        try containter.encode(type, forKey: .type)
    }
    
}

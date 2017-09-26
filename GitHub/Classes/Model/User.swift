//
//  Permissions.swift
//  GitHub
//
//  Created by Mathias Quintero on 9/2/17.
//

import Sweeft

public struct User: Codable {
    
    public enum UserType: String, Codable {
        case user = "User"
    }
    
    public let type: UserType
    public let id: String
    public let name: String?
    public let avatar: URL?
    
    public let bio: String?
    
    public let company: String?
    public let blog: URL?
    public let location: String?
    
    public let followers: Int?
    public let following: Int?
    
    public let hireable: Bool?
    
    public let created: Date?
    public let updated: Date?
    
    public enum CodingKeys: String, CodingKey {
        case id = "login"
        case type
        case name
        case avatar = "avatar_url"
        case bio
        case company
        case blog
        case location
        
        case followers
        case following
        
        case hireable
        
        case created = "created_at"
        case updated = "updated_at"
    }
    
}

extension User: GitHubObject {
    
    public typealias API = GitHub
    
    public typealias Identifier = String
    
    public enum Endpoint: String, APIEndpoint {
        case repos
        case orgs
    }
    
    public static var endpoint: GitHubEndpoint {
        return .users
    }
    
}

extension APIObject where Value == User {
    
    public func repos() -> Response<[APIObject<Repository>]> {
        return doRequest(to: .repos)
    }
    
    public func organizations() -> Response<[APIObject<Organization>]> {
        return doRequest(to: .orgs)
    }
    
}

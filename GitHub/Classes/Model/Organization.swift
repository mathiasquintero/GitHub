//
//  Organization.swift
//  GitHub
//
//  Created by Mathias Quintero on 9/27/17.
//

import Sweeft

public struct Organization: Codable {
    
    public let id: String
    public let name: String?
    public let avatar: URL?
    
    public let description: String?
    
    public let company: String?
    public let blog: URL?
    public let location: String?
    
    public let followers: Int?
    public let following: Int?
    
    public let created: Date?
    public let updated: Date?
    
    public enum CodingKeys: String, CodingKey {
        case id = "login"
        case name
        case avatar = "avatar_url"
        case description
        case company
        case blog
        case location
        
        case followers
        case following
        
        case created = "created_at"
        case updated = "updated_at"
    }
    
}

extension Organization: GitHubObject {
    
    public typealias API = GitHub
    public typealias Identifier = String
    
    public enum Endpoint: String, APIEndpoint {
        case members
        case outsideCollaborators = "outside_collaborators"
        case teams
        case issues
    }
    
    public static var endpoint: GitHubEndpoint {
        return .organizations
    }
    
}

extension APIObject where Value == Organization {
    
    public func members() -> Response<[APIObject<User>]> {
        return doRequest(to: .members)
    }
    
    public func outsideCollaborators() -> Response<[APIObject<User>]> {
        return doRequest(to: .outsideCollaborators)
    }
    
    public func issues() -> Response<[Issue]> {
        return doDecodableRequest(to: .issues)
    }
    
}

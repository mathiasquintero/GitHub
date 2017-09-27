//
//  User.swift
//  GitHub
//
//  Created by Mathias Quintero on 9/2/17.
//

import Sweeft

public struct User: APIObjectWithDetail {
    
    public struct Basic: APIBasic {
        public let id: String
        public let type: UserType
        public let avatar: URL?
        
        public enum CodingKeys: String, CodingKey {
            case id = "login"
            case type
            case avatar = "avatar_url"
        }
    }
    
    public enum UserType: String, Codable {
        case user = "User"
    }
    
    public struct Detail: Codable {
        
        public let name: String?
        public let bio: String?
        
        public let company: String?
        public let blog: URL?
        public let location: String?
        
        public let followers: Int
        public let following: Int
        
        public let hireable: Bool
        
        public let created: Date
        public let updated: Date
        
        public enum CodingKeys: String, CodingKey {
            case name
            
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
    
    public let basic: Basic
    public let detail: Detail?
    
    public init(basic: Basic, detail: Detail?) {
        self.basic = basic
        self.detail = detail
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

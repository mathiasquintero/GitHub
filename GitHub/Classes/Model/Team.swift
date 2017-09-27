//
//  Team.swift
//  GitHub
//
//  Created by Mathias Quintero on 9/27/17.
//

import Sweeft

public struct Team: APIObjectWithDetail {
    
    public struct Basic: APIBasic {
        public let id: Int
        public let name: String
        public let slug: String
        public let description: String?
        public let privacy: Privacy
    }
    
    public struct Detail: Codable {
        public let members: Int
        public let repos: Int
        public let created: Date
        public let updated: Date
        public let organization: Organization
        
        public enum CodingKeys: String, CodingKey {
            case members = "members_count"
            case repos = "repos_count"
            case created = "created_at"
            case updated = "updated_at"
            case organization
        }
    }
    
    public let basic: Basic
    public let detail: Detail?
    
    public init(basic: Basic, detail: Detail?) {
        self.basic = basic
        self.detail = detail
    }
    
}

extension Team {
    
    public enum Privacy: String, Codable {
        case open
        case closed
    }
    
}

extension Team: GitHubObject {
    
    public enum Endpoint: String, APIEndpoint {
        case repos
        case members
    }
    
    public typealias API = GitHub
    public typealias Identifier = Int
    
    public static var endpoint: GitHub.Endpoint {
        return .teams
    }
    
}

extension APIObject where Value == Team {
    
    public func repos() -> Response<[APIObject<Repository>]> {
        return doRequest(to: .repos)
    }
    
    public func members() -> Response<[APIObject<User>]> {
        return doRequest(to: .members)
    }
    
}

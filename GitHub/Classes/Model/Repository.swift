//
//  Repository.swift
//  GitHub
//
//  Created by Mathias Quintero on 9/2/17.
//

import Sweeft

public struct Repository: Codable {
    public let id: Int
    public let name: String
    public let fullName: String
    
    public let description: String?
    public let homepage: String?
    
    public let language: String?
    
    public let forksCount: Int?
    public let starsCount: Int?
    public let watchersCount: Int?
    public let openIssuesCount: Int?
    
    public let defaultBranch: String?
    
    public let size: Int?
    
    public let created: Date?
    public let updated: Date?
    public let pushed: Date?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        
        case description
        case homepage
        
        case language
        
        case forksCount = "forks_count"
        case starsCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case openIssuesCount = "open_issues_count"
        
        case defaultBranch = "default_branch"
        
        case size
        
        case created = "created_at"
        case updated = "updated_at"
        case pushed = "pushed_at"
    }
}

extension Repository {
    
    public struct Clone: Codable {
        let http: URL
        let ssh: URL
    }
    
    public enum Permission: String, Codable {
        
        static var all: [Permission] = [.admin, .push, .pull]
        
        case admin
        case push
        case pull
    }
    
}

extension Repository: GitHubObject {
    
    public enum Endpoint: String, APIEndpoint {
        case collaborators = "collaborators"
    }
    
    public typealias API = GitHub
    public typealias Identifier = Int
    
    public static var endpoint: GitHub.Endpoint {
        return .repos
    }
    
}

extension APIObject where Value == Repository {
    
    public func collaborators() -> Response<[APIObject<User>]> {
        return doRequest(to: .collaborators)
    }
    
}

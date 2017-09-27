//
//  Gist.swift
//  Sweeft
//
//  Created by Mathias Quintero on 9/27/17.
//

import Sweeft

public struct Gist: APIObjectWithDetail {
    
    public struct Basic: APIBasic {
        public let id: String
        public let description: String?
        
        public let owner: Owner
        
        public let files: Files
        public let comments: Int
        
        public let isPublic: Bool
        
        public let created: Date
        public let updated: Date
        
        public enum CodingKeys: String, CodingKey {
            case id
            case description
            case owner
            case files
            case comments
            case isPublic = "public"
            case created = "created_at"
            case updated = "updated_at"
        }
    }
    
    public struct Detail: Codable {
        public let isFork: Bool
        public let forks: [Fork]
        public let history: [HistoryItem]
        
        public enum CodingKeys: String, CodingKey {
            case isFork = "fork"
            case forks
            case history
        }
    }
    
    public let basic: Basic
    public let detail: Detail?
    
    public init(basic: Basic, detail: Detail?) {
        self.basic = basic
        self.detail = detail
    }
    
}

extension Gist {
    
    public struct Fork: Codable {
        public let id: String
        public let owner: Owner
        public let created: Date
        public let updated: Date
        
        public enum CodingKeys: String, CodingKey {
            case id
            case owner = "user"
            case created = "created_at"
            case updated = "updated_at"
        }
    }
    
    public struct HistoryItem: Codable {
        
        public struct Status: Codable {
            public let additions: Int
            public let deletions: Int
            public let total: Int
        }
        
        public let version: String
        public let user: User
        public let status: Status
        public let committed: Date
        
        public enum CodingKeys: String, CodingKey {
            case version
            case user
            case status
            case committed = "committed_at"
        }
    }
    
    public struct File {
        
        public struct Info: Codable {
            public let size: Int
            public let raw: URL
            public let language: String?
            
            public enum CodingKeys: String, CodingKey {
                case size
                case raw = "raw_url"
                case language
            }
        }
        
        public let name: String
        public let info: Info
        
    }
    
    public struct Files {
        let files: [File]
    }
    
}

extension Gist.Files: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringKey.self)
        let files = try container.allKeys.map {
            Gist.File(name: $0.stringValue,
                      info: try container.decode(Gist.File.Info.self, forKey: $0))
        }
        self.init(files: files)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringKey.self)
        try files.forEach { file in
            try container.encode(file.info, forKey: .init(file.name))
        }
    }
    
}

extension Gist: APIObjectValue {
    
    public typealias API = GitHub
    public typealias Identifier = String
    
    public enum Endpoint: String, APIEndpoint {
        case commits
        case star
    }
    
    public static var endpoint: GitHubEndpoint {
        return .gists
    }
    
}

struct StringKey: CodingKey {
    
    let stringValue: String
    
    var intValue: Int? {
        return nil
    }
    
    init(_ stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        return nil
    }
    
    init?(stringValue: String) {
        self.init(stringValue)
    }
}

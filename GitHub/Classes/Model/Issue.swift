//
//  Issue.swift
//  GitHub
//
//  Created by Mathias Quintero on 9/27/17.
//

import Foundation

public struct Issue: Codable {
    
    public let id: Int
    public let number: Int
    public let title: String
    public let body: String?
    public let assignees: [User]
    
    public let state: State
    public let owner: Owner
    
    public let comments: Int
    public let labels: [Label]
    public let milestone: Milestone?
    
    public let created: Date
    public let updated: Date
    public let closes: Date?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case number
        case title
        case body
        case assignees
        case state
        case owner = "user"
        case comments
        case labels
        case milestone
        case created = "created_at"
        case updated = "updated_at"
        case closes = "closes_at"
    }
    
}

extension Issue {
    
    public enum State: String, Codable {
        case open
        case closed
    }
    
    public struct Label: Codable {
        public let name: String
        public let color: String
        public let isDefault: Bool
        
        public enum CodingKeys: String, CodingKey {
            case name
            case color
            case isDefault = "default"
        }
    }
    
    public struct Milestone: Codable {
        public let id: Int
        public let number: Int
        public let title: String
        public let description: String?
        
        public let creator: Owner
        
        public let openIssues: Int
        public let closedIssues: Int
        public let state: State
        
        public let created: Date
        public let updated: Date
        public let due: Date?
        public let closes: Date?
        
        public enum CodingKeys: String, CodingKey {
            case id
            case number
            case title
            case description
            case creator
            case openIssues = "open_issues"
            case closedIssues = "closed_issues"
            case state
            case created = "created_at"
            case updated = "updated_at"
            case due = "due_on"
            case closes = "closes_at"
        }
    }
    
}

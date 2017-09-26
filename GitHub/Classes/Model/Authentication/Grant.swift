//
//  Grant.swift
//  GitHub
//
//  Created by Mathias Quintero on 9/2/17.
//

import Sweeft

struct Grant: Codable {
    
    public let id: Int
    public let url: URL
    public let app: App
    public let created: Date
    public let upated: Date
    public let scopes: [Scope]
    
}

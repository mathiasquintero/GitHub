//
//  Authorization.swift
//  GitHub
//
//  Created by Mathias Quintero on 9/2/17.
//

import Foundation

struct Authorization: Codable {
    
    let grant: Grant
    let token: String
    let hashedToken: String
    let note: String?
    let noteURL: URL?
    let fingerPrint: String
    
}

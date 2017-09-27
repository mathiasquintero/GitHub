//
//  GitHub.swift
//  GitHub
//
//  Created by Mathias Quintero on 9/2/17.
//

import Sweeft

public class GitHub: API {
    
    public typealias Endpoint = GitHubEndpoint
    public var baseURL: String
    
    public lazy var auth: Auth = {
        return NoAuth.standard
    }()
    
    public init(baseURL: String) {
        self.baseURL = baseURL
    }
    
}

protocol GitHubObject: APIObjectValue where API == GitHub {}

extension GitHub {
    
    public func render(markdown: String, mode: RenderMode = .markdown) -> Response<Data> {
        
        let body: JSON = [
            "text": markdown,
            "mode": mode.rawValue,
        ]
        return doDataRequest(with: .post, to: .markdown, body: body.data)
    }
    
}

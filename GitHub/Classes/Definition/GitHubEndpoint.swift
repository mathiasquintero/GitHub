//
//  GitHubEndpoint.swift
//  GitHub
//
//  Created by Mathias Quintero on 9/2/17.
//

import Sweeft

public enum GitHubEndpoint: String, APIEndpoint {
    case markdown
    
    case gitignoreTemplates = "/gitignore/templates"
    case gitignore = "/gitignore/templates/{id}"
    
    case repoByName = "repos/{name}"
    
    case grants = "applications/grants"
    case authorizations = "authorizations"
    case organizations = "orgs"
    case gists
    case teams
    case repos = "repositories"
    case users
}

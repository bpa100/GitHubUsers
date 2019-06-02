//
//  EndPoints.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

enum Endpoint {
    case users(since: String)
    case repositories(since: String)

    var path: String {
        switch self {
        case .users:
            return "/users"
        case .repositories:
            return "/repositories"
        }
    }
}

extension Endpoint: RequestParameters {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }

    var method: HTTPMethod {
        return .get
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .users(let since), .repositories(since: let since):
            return [URLQueryItem(name: "since", value: since)]
        }
    }
}

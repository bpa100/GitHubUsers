//
//  EndPoints.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

enum Endpoint {
    case users

    var basePath: String {
        return "https://api.github.com/"
    }

    var path: String {
        switch self {
        case .users:
            return "users"
        }
    }
}

extension Endpoint: RequestParameters {
    var url: URL? {
        return URL(string: basePath + path)
    }

    var method: HTTPMethod {
        return .get
    }

    var options: [String : Any]? {
        return nil
    }

    var headers: [String : String]? {
        return nil
    }
}

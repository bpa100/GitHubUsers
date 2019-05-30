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
}

extension Endpoint: RequestParameters {
    var baseUrl: URL {
        guard let url = URL(string: "https://api.github.com/") else {
            fatalError("Incorrect base url")
        }

        return url
    }

    var path: String {
        switch self {
        case .users:
            return "users"
        }
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

//
//  NetworkCore.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case parsingError
}

enum HTTPMethod: String {
    case get = "get"
    case post = "post"
    case patch = "patch"
    case delete = "delete"
}

protocol RequestParameters {
    var url: URL? { get }
    var method: HTTPMethod { get }
}

protocol Network {
    func performRequest(
        parameters: RequestParameters,
        completion: @escaping (Result<(URLResponse?, Data?), Error>) -> ()
        ) -> URLSessionTask?
}

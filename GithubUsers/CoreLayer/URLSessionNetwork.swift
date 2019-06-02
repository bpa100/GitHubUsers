//
//  URLSessionNetwork.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

class URLSessionNetwork: Network {
    func performRequest(
        parameters: RequestParameters,
        completion: @escaping (Result<(URLResponse?, Data?), Error>) -> ()
        ) -> URLSessionTask? {
        guard let url = parameters.url else {
            let error = NSError(domain: "invalid url", code: 0, userInfo: nil)
            completion(.failure(error))
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = parameters.method.rawValue

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request, completionHandler: {data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            completion(.success((response, data)))
        })
        task.resume()
        return task
    }
}

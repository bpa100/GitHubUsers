//
//  URLSessionNetwork.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

class URLSessionNetwork: Network {
    func performRequest(parameters: RequestParameters, completion: @escaping (URLResponse?, Data?) -> ()) -> URLSessionTask? {
        guard let url = parameters.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = parameters.method.rawValue

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request, completionHandler: {data, response, error in
            completion(response, data)
        })
        task.resume()
        return task
    }
}

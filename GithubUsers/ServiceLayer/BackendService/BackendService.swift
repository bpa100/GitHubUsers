//
//  BackendService.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import UIKit

protocol BackendService {
    func request<Model: Codable>(
        endpoint: Endpoint,
        for model: Model.Type,
        completion: @escaping (Model) -> Void)
}

class BackendServiceImplementation: BackendService {
    let network: Network

    init(network: Network) {
        self.network = network
    }

    func request<Model>(endpoint: Endpoint, for model: Model.Type, completion: @escaping (Model) -> Void) where Model : Decodable, Model : Encodable {
        _ = network.performRequest(parameters: endpoint, completion: { _, data in
            guard let data = data,
                let object = try? JSONDecoder().decode(model, from: data) else {
                    return
            }

            completion(object)
        })
    }
}

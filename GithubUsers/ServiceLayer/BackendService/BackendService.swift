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
        completion: (Model) -> Void)
}

class BackendServiceImplementation: BackendService {
    var network: Network!

    func request<Model>(endpoint: Endpoint, for model: Model.Type, completion: (Model) -> Void) where Model : Decodable, Model : Encodable {

    }
}

//
//  BackendServiceFactory.swift
//  GithubUsers
//
//  Created by bakhirev on 01/06/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

protocol BackendServiceFactory {
    func createBackendService() -> BackendService
}

extension DependencyContainer: BackendServiceFactory {
    func createBackendService() -> BackendService {
        return BackendServiceImplementation(network: network)
    }
}

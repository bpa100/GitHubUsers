//
//  UsersServiceFactory.swift
//  GithubUsers
//
//  Created by bakhirev on 01/06/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

protocol RepositoriesServiceFactory {
    func createRepositoriesService() -> RepositoriesService
}

extension DependencyContainer: RepositoriesServiceFactory {
    func createRepositoriesService() -> RepositoriesService {
        return RepositoriesServiceImplementation(backendService: createBackendService())
    }
}

//
//  UsersServiceFactory.swift
//  GithubUsers
//
//  Created by bakhirev on 01/06/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

protocol UsersServiceFactory {
    func createUsersService() -> UsersService
}

extension DependencyContainer: UsersServiceFactory {
    func createUsersService() -> UsersService {
        return UsersServiceImplementation(backendService: createBackendService())
    }
}

//
//  UsersService.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

protocol UsersService {
    func fetchUsers(completion: ([User]) -> Void)
}

class UsersServiceImplementation: UsersService {
    var backendService: BackendService!

    func fetchUsers(completion: ([User]) -> Void) {
        backendService.request(endpoint: .users, for: [User].self, completion: { users in
            completion(users)
        })
    }
}

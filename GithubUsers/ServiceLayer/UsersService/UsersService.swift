//
//  UsersService.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

protocol UsersService {

}

class UsersServiceImplementation {
    var backendService: BackendService!

    func users() {
        backendService.request(endpoint: .users, for: User.self, completion: {o in
            
        })
    }
}

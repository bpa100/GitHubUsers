//
//  UsersPresenter.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

class UsersPresenter: UsersOutput {
    weak var view: UsersInput?
    let usersService: UsersService

    init(view: UsersInput, usersService: UsersService) {
        self.view = view
        self.usersService = usersService
    }

    func fetch() {
        usersService.fetchUsers(completion: {_ in

        })
    }
}


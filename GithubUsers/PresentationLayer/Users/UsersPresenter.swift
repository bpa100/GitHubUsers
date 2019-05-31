//
//  UsersPresenter.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

class UsersPresenter: UsersOutput {
    weak var view: UsersInput!
    var service: UsersService!

    init(view: UsersInput) {
        self.view = view
    }
}


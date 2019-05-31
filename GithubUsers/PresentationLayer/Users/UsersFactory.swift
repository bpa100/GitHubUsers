//
//  UsersFactory.swift
//  GithubUsers
//
//  Created by bakhirev on 31/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

protocol UsersFactory {
    func createUsersViewController() -> UsersViewController
}

extension DependencyContainer: UsersFactory {
    func createUsersViewController() -> UsersViewController {
        let view = UsersViewController()
        let presenter = UsersPresenter(view: view)
        presenter.service = usersService
        view.presenter = presenter
        return view
    }
}

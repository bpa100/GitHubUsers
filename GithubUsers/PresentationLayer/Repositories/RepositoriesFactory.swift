//
//  UsersFactory.swift
//  GithubUsers
//
//  Created by bakhirev on 31/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

protocol RepositoriesFactory {
    func createRepositoriesViewController() -> RepositoriesViewController
}

extension DependencyContainer: RepositoriesFactory {
    func createRepositoriesViewController() -> RepositoriesViewController {
        let view = RepositoriesViewController()
        let presenter = RepositoriesPresenter(view: view, repositoriesService: createRepositoriesService())
        view.presenter = presenter
        return view
    }
}

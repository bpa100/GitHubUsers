//
//  UsersPresenter.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

class RepositoriesPresenter: RepositoriesOutput {
    weak var view: RepositoriesInput?
    let repositoriesService: RepositoriesService

    init(view: RepositoriesInput, repositoriesService: RepositoriesService) {
        self.view = view
        self.repositoriesService = repositoriesService
    }

    func fetchRepositories(since: Repository?) {
        repositoriesService.fetchRepositories(since: since, completion: { [weak self] repositories in
            self?.view?.show(repositories: repositories)
        })
    }
}


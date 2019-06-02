//
//  UsersInput.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

protocol RepositoriesOutput {
    var view: RepositoriesInput? { get set }

    func fetchRepositories(since: Repository?)
}

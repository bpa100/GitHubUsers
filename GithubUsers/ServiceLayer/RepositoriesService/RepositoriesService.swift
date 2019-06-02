//
//  UsersService.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

protocol RepositoriesService {
    func fetchRepositories(since: Repository?, completion: @escaping ([Repository]) -> Void)
}

class RepositoriesServiceImplementation: RepositoriesService {
    let backendService: BackendService

    init(backendService: BackendService) {
        self.backendService = backendService
    }

    func fetchRepositories(since: Repository?, completion: @escaping ([Repository]) -> Void) {
        let sinceId: String = "\(since?.id ?? 0)"
        let endPoint: Endpoint = .repositories(since: sinceId)
        backendService.request(endpoint: endPoint, for: [Repository].self, completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repositories):
                    completion(repositories)
                default:
                    break
                }
            }
        })
    }
}

//
//  UsersInput.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

protocol UsersOutput {
    var view: UsersInput? { get set }

    func fetch()
}

//
//  User.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let avatarUrl: String?
    let email: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case email
        case url
    }
}

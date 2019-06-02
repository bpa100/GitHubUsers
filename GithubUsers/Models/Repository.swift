//
//  Repository.swift
//  GithubUsers
//
//  Created by bakhirev on 01/06/2019.
//  Copyright © 2019 None. All rights reserved.
//

import Foundation

struct Repository: Codable {
    let id: Int
    let owner: User
    let fullName: String
    let description: String?
    let htmlURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case owner
        case fullName = "full_name"
        case description
        case htmlURL = "html_url"
    }
}

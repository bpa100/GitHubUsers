//
//  ViewController.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    var presenter: UsersOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension UsersViewController: UsersInput {
    
}


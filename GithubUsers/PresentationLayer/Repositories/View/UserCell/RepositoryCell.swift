//
//  UserCell.swift
//  GithubUsers
//
//  Created by bakhirev on 01/06/2019.
//  Copyright © 2019 None. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryCell: UITableViewCell {
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var urlTextView: UITextView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        urlTextView.textContainerInset = UIEdgeInsets.zero
        urlTextView.textContainer.lineFragmentPadding = 0
        avatarImageView.layer.cornerRadius = 5
    }

    static var identifier: String {
        return "RepositoryCell"
    }

    func configure(item: Repository) {
        fullNameLabel.text = item.fullName
        descriptionLabel.text = item.description
        urlTextView.text = item.htmlURL

        if let urlString = item.owner.avatarUrl,
            let url = URL(string: urlString) {
            let resource = ImageResource(downloadURL: url)
            avatarImageView.kf.setImage(with: resource)
        }
    }
}


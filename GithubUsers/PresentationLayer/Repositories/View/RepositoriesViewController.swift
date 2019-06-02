//
//  ViewController.swift
//  GithubUsers
//
//  Created by bakhirev on 29/05/2019.
//  Copyright © 2019 None. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {
    var presenter: RepositoriesOutput!

    private let tableView = UITableView()
    private var repositories: [Repository] = []

    private let activityIndicator = UIActivityIndicatorView(style: .gray)

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Public repositories"
        view.backgroundColor = .white
        layout()
        configureTable()

        showIndication()
        loadData()
    }

    private func layout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
    }

    private func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self

        let cellNib = UINib(nibName: RepositoryCell.identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: RepositoryCell.identifier)
    }

    // MARK: - Actions

    func loadData() {
        presenter.fetchRepositories(since: repositories.last)
    }

    private func showIndication() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])

        activityIndicator.startAnimating()
    }

    private func hideIndication() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}

extension RepositoriesViewController: RepositoriesInput {
    func show(repositories: [Repository]) {
        hideIndication()
        self.repositories += repositories
        tableView.reloadData()
    }
}

extension RepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repository = repositories[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCell.identifier) as? RepositoryCell
        cell?.configure(item: repository)
        return cell ?? UITableViewCell()
    }
}

extension RepositoriesViewController: UITableViewDelegate {
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
        ) {
        let offsetForLoad: CGFloat = 200
        let distanceToEnd = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        if distanceToEnd < offsetForLoad {
            loadData()
        }
    }
}

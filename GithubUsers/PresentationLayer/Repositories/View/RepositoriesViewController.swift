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

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Public repositories"
        view.backgroundColor = .white
        layout()
        configureTable()
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
}

extension RepositoriesViewController: RepositoriesInput {
    func show(repositories: [Repository]) {
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
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        if distance < offsetForLoad {
            loadData()
        }
    }
}

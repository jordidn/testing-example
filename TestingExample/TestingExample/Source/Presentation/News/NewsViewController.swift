//
//  NewsViewController.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

class NewsViewController: BaseViewController<NewsPresenter> {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        setupTableView()
    }
    
    
    // MARK: - Private methods
    
    private func setupTableView() {
        let bundle = Bundle(for: Self.self)
        
        tableView.registerCell(cell: NewsItemTableViewCell.self, bundle: bundle)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
}


// MARK: - View Protocol implementation

extension NewsViewController: NewsView {
    
    func didLoadNews() {
        tableView.reloadData()
    }
    
}


// MARK: - DataSource

extension NewsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.news?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableBy(cell: NewsItemTableViewCell.self, indexPath: indexPath),
              let newsEntity = presenter.news?.element(at: indexPath.row) else {
                  return UITableViewCell()
              }
        cell.setup(with: newsEntity)
        return cell
    }
    
}


// MARK: - Delegate

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectNewsItem(at: indexPath)
    }
    
}

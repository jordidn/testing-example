//
//  NewsItemTableViewCell.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

class NewsItemTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    
    // MARK: - Properties
    
    private var newsEntity: NewsEntity?
    
    
    // MARK: - Lifecyle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    // MARK: - Setup
    
    func setup(with news: NewsEntity) {
        self.newsEntity = news
        setupUI()
    }
    
    
    // MARK: - Private methods
    
    private func setupUI() {
        guard let model = self.newsEntity else { return }
        titleLabel.text = model.title
        dateLabel.text = model.date
        descriptionLabel.text = model.description
    }

}

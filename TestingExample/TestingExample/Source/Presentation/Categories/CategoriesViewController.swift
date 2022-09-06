//
//  CategoriesViewController.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit
import SwiftUI

class CategoriesViewController: BaseViewController<CategoriesPresenter> {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var containerView: UIView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
    }
    
}


// MARK: - View Protocol implementation

extension CategoriesViewController: CategoriesView {
    
    func didLoadCategories() {
        let viewModel = CategoriesListView.ViewModel(categories: presenter.categories) { [weak self] category in
            self?.presenter.didSelectCategory(category)
        }
        
        let view = CategoriesListView(viewModel: viewModel)
        containerView.addHostingController(rootView: view, parent: self)
    }
    
}

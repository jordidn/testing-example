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








extension UIView {
    
    func addHosting<Content>(rootView: Content) where Content: View {
        let childView: UIView = UIHostingController(rootView: rootView).view
        self.addSubview(childView)
        childView.addAllEdgesConstraint(to: self)
    }
    
    func addHostingController<Content>(rootView: Content, parent: UIViewController) where Content: View {
        let childView = UIHostingController(rootView: rootView)
        parent.addChild(childView)
        self.addSubview(childView.view)
        childView.view.addAllEdgesConstraint(to: self)
        childView.didMove(toParent: parent)
    }
    
    
    func addAllEdgesConstraint(to view: UIView? = nil, constants: (sides: CGFloat, topDown: CGFloat) = (0,0)) {
        let view: UIView = view ?? self
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: constants.topDown).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constants.topDown).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constants.sides).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constants.sides).isActive = true
    }
    
}

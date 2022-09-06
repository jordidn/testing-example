//
//  CategoriesPresenter.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import Foundation

protocol CategoriesView: BaseViewProtocol {
    func didLoadCategories()
}

class CategoriesPresenter: BasePresenter {
    
    // MARK: - Dependencies
    
    private let getCategoriesUseCase: GetCategoriesUseCase
    
    
    // MARK: - Init
    
    init(getCategoriesUseCase: GetCategoriesUseCase,
         schedulers: Schedulers) {
        self.getCategoriesUseCase = getCategoriesUseCase
        super.init(schedulers: schedulers)
    }
    
    
    // MARK: - Properties
    
    private (set) var categories: [String] = []
    
    var view: CategoriesView? {
        return baseView as? CategoriesView
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCategoriesUseCase.execute()
            .applySchedulers()
            .handleError(presenter: self)
            .subscribe(onSuccess: { [weak self] categories in
                self?.categories = categories
                self?.view?.didLoadCategories()
            })
            .disposed(by: disposeBag)
    }
    
    
    // MARK: - Public methods
    
    func didSelectCategory(_ category: String) {
        // TODO: - Open wireframe news view controller
        print("did select: \(category)")
    }
    
}

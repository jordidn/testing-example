//
//  NewsPresenter.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import Foundation

protocol NewsView: BaseViewProtocol {
    func didLoadNews()
}

class NewsPresenter: BasePresenter {

    // MARK: - Dependencies
    
    private let getNewsUseCase: GetNewsUseCase

    
    // MARK: - Init
    
    init(getNewsUseCase: GetNewsUseCase,
         schedulers: Schedulers) {
        self.getNewsUseCase = getNewsUseCase
        super.init(schedulers: schedulers)
    }

    
    // MARK: - Properties
    
    private var category: String!
    private (set) var news: [NewsEntity]?
    
    var view: NewsView? {
        return baseView as? NewsView
    }
    
    
    // MARK: - Setup
    
    func setup(category: String) {
        self.category = category
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNewsUseCase.execute(with: .init(category: category))
            .applySchedulers()
            .handleError(presenter: self)
            .subscribe(onSuccess: { [weak self] news in
                self?.news = news
                self?.view?.didLoadNews()
            })
            .disposed(by: disposeBag)
    }
    
    
    // MARK: - Public methods
    
    func didSelectNewsItem(at indexPath: IndexPath) {
        guard let newsItem = news?.element(at: indexPath.row) else { return }
        print("did select: \(newsItem.author)")
    }
    
}

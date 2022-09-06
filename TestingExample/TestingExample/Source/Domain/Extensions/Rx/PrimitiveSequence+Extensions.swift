//
//  PrimitiveSequence+Extensions.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit
import RxSwift

// MARK: - Single extension

extension PrimitiveSequence where Trait == SingleTrait {
    
    func loading(view: Loadable?, loadingIndicatorMessage: LoadingIndicatorMessage? = nil, alpha: CGFloat = 0.5) -> Single<Element> {
        view?.showLoading(loadingIndicatorMessage: loadingIndicatorMessage, alpha: alpha)
        return self.do(onSuccess: { _ in view?.hideLoading()},
                       onError: { _ in
            view?.hideLoading()})
    }
    
    func handleError(presenter: BasePresenter, shownTop: Bool? = nil, topOffset: CGFloat = 0, bottomOffset: CGFloat = 20, in view: UIView? = nil) -> Single<Element> {
        return self.do(onError: { error in
            switch error {
            case let customerror as CustomError:
                presenter.handle(customError: customerror, in: view)
            default:
                presenter.handle(customError: .generic, in: view)
            }
        })
    }
    
    func delay(milliseconds: Int, schedulers: Schedulers = Schedulers()) -> Single<Element> {
        return self.delay(RxTimeInterval.milliseconds(milliseconds), scheduler: MainScheduler.instance)
    }
    
}



// MARK: - Completable extension

extension PrimitiveSequence where Trait == CompletableTrait, Element == Never {
    
    func loading(view: Loadable?, loadingIndicatorMessage: LoadingIndicatorMessage? = nil, alpha: CGFloat = 0.5) -> Completable {
        view?.showLoading(loadingIndicatorMessage: loadingIndicatorMessage, alpha: alpha)
        return self.do(onError: { error in
            view?.hideLoading()
        }, onCompleted: {
            view?.hideLoading()
        })
    }
    
    func handleError(presenter: BasePresenter, shownTop: Bool? = nil, topOffset: CGFloat = 0, bottomOffset: CGFloat = 20, in view: UIView? = nil) -> Completable {
        return self.do(onError: { error in
            switch error {
            case let customError as CustomError:
                presenter.handle(customError: customError, in: view)
            default:
                presenter.handle(customError: .generic, in: view)
            }
        })
    }
    
}

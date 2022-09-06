//
//  BasePresenter.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import Foundation
import RxSwift
import UIKit

class BasePresenter: NSObject {
    
    internal weak var baseView: BaseView?
    internal var disposeBag: DisposeBag

    //TOIMPROVE: Make these two constants and internal. Must be presenter's dependencies and VC shouldn't have access to them.
    /// Do NOT reffer this from any UIView / UIViewController instances.
    var wireframe: Wireframe!
    /// Do NOT reffer this from any UIView / UIViewController instances.
    let schedulers: Schedulers
    
    //TOIMPROVE: Inject Wireframe dependency in the constructor.
    init(schedulers: Schedulers) {
        self.schedulers = schedulers
        self.disposeBag = DisposeBag()
    }
    
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
    
    func attachView<T: BaseView>(view: T) {
        self.baseView = view
    }
    
    func handle(customError: CustomError, in view: UIView? = nil) {
        //Ensure its handled in main thread
        guard Thread.isMainThread else {
            return DispatchQueue.main.sync {
                handle(customError: customError, in: view)
            }
        }
        baseView?.hideLoading()
        switch customError {
        case .mapping:
            print("Mapping Error")
        }
    }
    
    func popCurrentScreen() {
        wireframe.popCurrentScreen()
    }
    
    func popCurrentScreen(onCompletion: @escaping() -> Void) {
        wireframe.popCurrentScreen(onCompletion: onCompletion)
    }
    
    func popCurrentScreen(animated: Bool) {
        wireframe.popCurrentScreen(animated: animated)
    }
    
    func popCurrentScreen(animated: Bool, onCompletion: @escaping () -> Void) {
        wireframe.popCurrentScreen(animated: animated, onCompletion: onCompletion)
    }
    
    func popToViewController(_ vc: UIViewController.Type) {
        wireframe.popToViewController(vc)
    }
    
}


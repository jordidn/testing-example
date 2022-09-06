//
//  BaseViewController.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

class BaseViewController<P: BasePresenter>: UIViewController, BaseViewProtocol {
    
    typealias Presenter = P

    var presenter: Presenter!
    private var singleFingerTap: UITapGestureRecognizer?
    var currentLoadable: Loadable? = nil
    var loadingIndicator: FullScreenLoadingIndicator?
    open private (set) var loadingIndicatorColor: UIColor = .gray
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.viewDidLoad()
        setupNavigationbar()
        addBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.attachView(view: self)
        presenter.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.viewDidDisappear()
    }
    
    
    // MARK: - Actions
    
    @objc func goBack(_ sender: UIButton) {
        self.closeViewController()
    }
    
    func closeViewController() {
        presenter.popCurrentScreen()
    }
    
    @objc func handleBaseSingleTapNotification(_ tapRecognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - Loadable
    
    func showLoading() {
        if loadingIndicator == nil {
            loadingIndicator = FullScreenLoadingIndicator()
        }
    }
    
    func showLoading(loadingIndicatorMessage: LoadingIndicatorMessage?, alpha: CGFloat = 0.5) {
        if loadingIndicator == nil {
            loadingIndicator = FullScreenLoadingIndicator(loadingIndicatorMessage: loadingIndicatorMessage, alpha: alpha)
        }
    }
    
    func hideLoading() {
        loadingIndicator?.remove()
        loadingIndicator = nil
    }
    
    //MARK: - BaseView
    
    func showNativeAlert(title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showNativeAlert(title: String, message: String? = nil, leftButton: NativeAlertButton, rightButton: NativeAlertButton? = nil) {
        let nativeAlert = NativeAlertView(title: title, message: message, leftButton: leftButton, rightButton: rightButton)
        DispatchQueue.main.async(execute: {
            self.present(nativeAlert.alert, animated: true)
        })
    }
    
    func showError(title: String, message: String?) {
        showNativeAlert(title: title, message: message)
    }
    
    
    // MARK: - Gesture Recognizer implementation
    
    internal var viewCloseKeyboard: UIView?
    internal var tapView: UITapGestureRecognizer = UITapGestureRecognizer()
    
    // Obtain ViewController bottom Margin
    var bottomMarginToSuperview: CGFloat {
        var safeAreaMargin: CGFloat = 0.0
        safeAreaMargin = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? view.safeAreaInsets.bottom
        let tabBarHeight = self.tabBarController?.tabBar.frame.size.height
        
        return tabBarHeight ?? safeAreaMargin
    }
    
}

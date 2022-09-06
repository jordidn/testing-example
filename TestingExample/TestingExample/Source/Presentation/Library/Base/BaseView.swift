//
//  BaseView.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

protocol BaseView: AnyObject, Loadable {
    var currentLoadable: Loadable? { get set }
    func showNativeAlert(title: String, message: String?)
    func showError(title: String, message: String?)
}

protocol BaseTableView: BaseView {
    func reload()
}

protocol Loadable {
    func showLoading()
    func showLoading(loadingIndicatorMessage: LoadingIndicatorMessage?, alpha: CGFloat)
    func hideLoading()
}

extension Loadable {
    func showLoading(loadingIndicatorMessage: LoadingIndicatorMessage?, alpha: CGFloat) {
        //Show loading by default
        showLoading()
    }
}

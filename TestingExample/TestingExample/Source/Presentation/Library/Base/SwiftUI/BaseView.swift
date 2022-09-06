//
//  BaseView.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import SwiftUI

protocol BaseView: View {
    associatedtype VM: BaseViewModel
    var viewModel: VM { get set }
    init(viewModel: VM)
}

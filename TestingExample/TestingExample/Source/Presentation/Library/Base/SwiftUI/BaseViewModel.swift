//
//  BaseViewModel.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import Combine
import RxSwift

class BaseViewModel: ObservableObject {
    internal var disposables: Set<AnyCancellable>
    internal var disposeBag: DisposeBag
    
    internal init() {
        self.disposables = Set<AnyCancellable>()
        self.disposeBag = DisposeBag()
    }
}

class BaseWireframeViewModel: BaseViewModel {
    internal let wireframe: Wireframe
    
    internal init(wireframe: Wireframe) {
        self.wireframe = wireframe
        super.init()
    }
}

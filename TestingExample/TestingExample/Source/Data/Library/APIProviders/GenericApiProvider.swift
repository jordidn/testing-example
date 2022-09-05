//
//  GenericApiProvider.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Moya
import RxMoya
import RxSwift

class GenericApiProvider {
    
    // MARK: - Properties
    
    private var provider: MoyaProvider<MultiTarget>
    private var schedulers: Schedulers
    
    
    // MARK: - Init
    
    init(schedulers: Schedulers,
         provider: MoyaProvider<MultiTarget>? = nil) {
        self.schedulers = schedulers
        self.provider = provider ?? MoyaProvider<MultiTarget>()
    }
    
    
    // MARK: - Public methods
    
    func request(_ target: TargetType) -> Single<Response> {
        return provider.rx
            .request(MultiTarget(target))
            .bgThread(schedulers: schedulers)
    }
    
}

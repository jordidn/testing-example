//
//  Schedulers.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 5/9/22.
//

import Moya
import RxSwift

struct Schedulers {
    
    // MARK: - Properties
    
    var mainThread = MainScheduler.instance
    
    
    // MARK: - Public methods
    
    func bgThread(priority: BackgroundThreadPriority) -> SchedulerType {
        return priority.schedulerType
    }
    
}

enum BackgroundThreadPriority {
    case main
    case high
    case medium
    case low
    
    var schedulerType: SchedulerType {
        switch self {
        case .main:
            return MainScheduler.instance
        case .high:
            return SerialDispatchQueueScheduler(qos: .userInitiated)
        case .medium:
            return SerialDispatchQueueScheduler(qos: .default)
        case .low:
            return SerialDispatchQueueScheduler(qos: .background)
        }
    }
}


// MARK: - Completable

extension PrimitiveSequence where Trait == CompletableTrait, Element == Never {
    
    func applySchedulers(schedulers: Schedulers = Schedulers(), priority: BackgroundThreadPriority = .low) -> Completable {
        return self.subscribe(on: schedulers.bgThread(priority: priority))
            .observe(on: schedulers.mainThread)
    }
    
    func bgThread(schedulers: Schedulers = Schedulers(), priority: BackgroundThreadPriority = .low) -> Completable {
        return self.observe(on: schedulers.bgThread(priority: priority))
    }
    
}


// MARK: - Single

extension PrimitiveSequence where Trait == SingleTrait {
    
    func applySchedulers(schedulers: Schedulers = Schedulers(), priority: BackgroundThreadPriority = .low) -> Single<Element> {
        return self.subscribe(on: schedulers.bgThread(priority: priority))
            .observe(on: schedulers.mainThread)
    }
    
    func bgThread(schedulers: Schedulers = Schedulers(), priority: BackgroundThreadPriority = .low) -> Single<Element> {
        return self.observe(on: schedulers.bgThread(priority: priority))
    }
    
}


// MARK: - Observable

extension Observable {
    
    func applySchedulers(schedulers: Schedulers = Schedulers(), priority: BackgroundThreadPriority = .low) -> Observable<Element> {
        return self.subscribe(on: schedulers.bgThread(priority: priority))
            .observe(on: schedulers.mainThread)
    }
    
    func bgThread(schedulers: Schedulers = Schedulers(), priority: BackgroundThreadPriority = .low) -> Observable<Element> {
        return self.observe(on: schedulers.bgThread(priority: priority))
    }
    
}

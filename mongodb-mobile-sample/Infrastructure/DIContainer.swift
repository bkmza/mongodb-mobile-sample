//
//  DIContainer.swift
//  mongodb-mobile-sample
//
//  Created by Ilya Usikov on 11/29/18.
//  Copyright © 2018 Ilya Usikov. All rights reserved.
//

import Foundation
import Swinject

class DIContainer {
    
    static let shared: DIContainer = {
        let diContainer = DIContainer()
        return diContainer
    }()
    
    let container: Container
    
    private init() {
        container = Container()
        container.register(MongoAdapterProtocol.self) { _ in MongoAdapter() }
        container.register(MongoStorageProtocol.self) { r -> MongoStorageProtocol in
            let adapter = r.resolve(MongoAdapterProtocol.self)!
            return MongoStorageService(adapter: adapter)
        }
    }
}

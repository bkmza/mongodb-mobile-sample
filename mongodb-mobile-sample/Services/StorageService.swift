//
//  BasePersistanceService.swift
//  mongodb-mobile-sample
//
//  Created by Ilya Usikov on 11/28/18.
//  Copyright © 2018 Ilya Usikov. All rights reserved.
//

import Foundation

class StorageService: StorageProtocol {
    
    let type: StorageType?
    let storage: StorageProtocol
    
    init(storage: StorageProtocol) {
        self.storage = storage
        self.type = storage.type
    }
    
    func getCount() -> Int {
        let count = self.storage.getCount()
        Logger.shared.log.info(("StorageService.getCount called for \(self.type!.rawValue) adapter. Value is \(count)."))
        return count
    }
}

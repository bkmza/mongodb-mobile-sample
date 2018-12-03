//
//  BasePersistanceService.swift
//  mongodb-mobile-sample
//
//  Created by Ilya Usikov on 11/28/18.
//  Copyright © 2018 Ilya Usikov. All rights reserved.
//

import Foundation

class BaseStorageService: BaseStorageProtocol {
    
    let storage: StorageProtocol
    
    init(storage: StorageProtocol) {
        self.storage = storage
    }
    
    func getCount() -> Int {
        let adapter = self.storage.persistanceAdapter ?? "default"
        print("I'm playing with \(adapter).")
        return self.storage.getCount()
    }
}

//
//  BasePersistanceService.swift
//  mongodb-mobile-sample
//
//  Created by Ilya Usikov on 11/28/18.
//  Copyright © 2018 Ilya Usikov. All rights reserved.
//

import Foundation

class StorageService: StorageProtocol {
    
    let name: String?
    let storage: StorageProtocol
    
    init(storage: StorageProtocol) {
        self.storage = storage
        self.name = storage.name
    }
    
    func getCount() -> Int {
        print("I'm playing with \(String(describing: self.name)).")
        return self.storage.getCount()
    }
}

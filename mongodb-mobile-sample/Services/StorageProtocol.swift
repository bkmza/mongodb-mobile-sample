//
//  MongoPersistanceProtocol.swift
//  mongodb-mobile-sample
//
//  Created by Ilya Usikov on 11/28/18.
//  Copyright © 2018 Ilya Usikov. All rights reserved.
//

import Foundation

protocol StorageProtocol {
    
    var type: StorageType? { get }
    
    func getCount() -> Int
}

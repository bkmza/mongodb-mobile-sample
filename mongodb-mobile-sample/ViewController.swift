//
//  ViewController.swift
//  mongodb-mobile-sample
//
//  Created by Ilya Usikov on 11/23/18.
//  Copyright © 2018 Ilya Usikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storageService = StorageService(storage: DIContainer.shared.container.resolve(MongoStorageProtocol.self)!)
        print(storageService.getCount())
        
        
//        let sql = StorageService(storage: DIContainer.shared.container.resolve(SQLStorageProviderProtocol.self)!)
//        print("SQL count \(sql.getCount())")
    }
}


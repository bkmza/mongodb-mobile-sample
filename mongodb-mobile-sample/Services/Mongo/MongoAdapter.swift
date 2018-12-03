//
//  MongoPersistanceService.swift
//  mongodb-mobile-sample
//
//  Created by Ilya Usikov on 11/28/18.
//  Copyright © 2018 Ilya Usikov. All rights reserved.
//

import Foundation
import StitchCore
import StitchLocalMongoDBService
import MongoSwift

public class MongoAdapter {
    
    var stichAppClient: StitchAppClient?
    public var localMongoClient: MongoClient?
    
    init() {
        do {
            self.stichAppClient = try Stitch.initializeDefaultAppClient(withClientAppID: "<APP ID>")
            self.localMongoClient = try stichAppClient?.serviceClient(fromFactory: mongoClientFactory)
            print("Initialized successfully")
        } catch {
            self.stichAppClient = nil
            self.localMongoClient = nil
            print("Error initializing Mongodb Mobile")
        }
    }
}

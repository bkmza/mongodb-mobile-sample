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

protocol MongoStorageProtocol: StorageProtocol {
}

public class MongoStorageProvider: MongoStorageProtocol {
    
    var type: StorageType?
    var adapter: MongoAdapterProtocol
    var database: MongoDatabase?
    
    init(adapter: MongoAdapterProtocol) {
        self.type = .MongoDB
        self.adapter = adapter
        do {
            self.database = try adapter.localMongoClient?.db("mongo_db")
        } catch {
            print("")
        }
    }
    
    func getCount() -> Int {
        var itemsCount = -1
        do {
            let collection = try self.database?.collection("my_collection")
            itemsCount = try collection?.count() ?? -1;
        } catch {
        }
        return itemsCount
    }
}


//            let doc: Document = [
//                "me": "cool",
//                "numbers": 42
//            ]

// Point to the target collection and insert a document
//            let myLocalCollection = try localMongoClient.db("my_db").collection("my_collection")

//            let result = try myLocalCollection.insertOne(doc)
//            print(result)

//            let itemsCount = try myLocalCollection.count();
//            print(itemsCount)
//
//            let query: Document = ["numbers": 42]
//            let documents = try myLocalCollection.find(query)
//            for d in documents {
//                print(d)
//            }

//
//  SQLStorageProvider.swift
//  mongodb-mobile-sample
//
//  Created by Igor Mayorov on 1/8/19.
//  Copyright © 2019 Ilya Usikov. All rights reserved.
//  https://github.com/groue/GRDB.swift

import Foundation
import GRDB

protocol SQLStorageProviderProtocol: StorageProtocol {
}

public class SQLStorageProvider: SQLStorageProviderProtocol {
    private var dbQueue: DatabaseQueue!
    var type: StorageType?
    
    init() {
        type = .Sqlite
        
        let databaseURL = try! FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("GRDBdatabase.sqlite")

        do {
            dbQueue = try DatabaseQueue(path: databaseURL.path)
            try SQLStorageProvider.migrator.migrate(dbQueue)
            
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func getCount() -> Int {
      
        var count = 0
        do {
            count = try dbQueue.read { db in
                try PostSQL.fetchCount(db)
            }
        } catch {
            assertionFailure(error.localizedDescription)
        }
        return count
    }
}


extension SQLStorageProvider{
    
    private static var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        // Create a table "PostSQL"
        migrator.registerMigration("createTable_\(PostSQL.databaseTableName)") { db in
            
            try db.create(table: PostSQL.databaseTableName) { t in
                t.autoIncrementedPrimaryKey("id")
                //t.column(#keyPath(PostSQL.id), .integer).notNull().collate(.localizedCaseInsensitiveCompare)
                
                t.column("title", .text).notNull().collate(.localizedCaseInsensitiveCompare)
            }
        }
        
        
//        migrator.registerMigration("populate") { db in
//            let post = PostSQL(title: "test")
//            try post.insert(db)
////            // Populate the players table with random data
////            for _ in 0..<8 {
////                var player = Player(id: nil, name: Player.randomName(), score: Player.randomScore())
////                try player.insert(db)
////            }
//        }
        
        return migrator
    }
    
}

//
//  PostSQL.swift
//  mongodb-mobile-sample
//
//  Created by Igor Mayorov on 1/8/19.
//  Copyright © 2019 Ilya Usikov. All rights reserved.
//

import Foundation
import GRDB


class PostSQL: Record, PostProtocol, Codable {

    var id: Int
    var title: String
    
    init(title: String, id: Int = 0) {
        self.title = title
        self.id = id
        super.init()
    }
    
    
    //MARK: - Required
    open override class var databaseTableName: String {
        return "PostSQL"
    }
    
    required init(row: Row) {
        id = row["id"]
        title = row["title"]
        
        super.init(row: row)
    }
    
    override func encode(to container: inout PersistenceContainer) {
        container["id"] = id
        container["title"] = title
    }
    
    override func didInsert(with rowID: Int64, for column: String?) {
        id = Int(rowID)
    }
}

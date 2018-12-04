//
//  Logger.swift
//  mongodb-mobile-sample
//
//  Created by Ilya Usikov on 12/4/18.
//  Copyright © 2018 Ilya Usikov. All rights reserved.
//

import Foundation
import SwiftyBeaver

class Logger {
    
    let log = SwiftyBeaver.self
    
    static let shared: Logger = {
        let instance = Logger()
        return instance
    }()
    
    private init() {
        let console = ConsoleDestination()  // log to Xcode Console
        log.addDestination(console)
    }
}

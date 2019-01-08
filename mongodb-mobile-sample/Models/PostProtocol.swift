//
//  PostProtocol.swift
//  mongodb-mobile-sample
//
//  Created by Igor Mayorov on 1/8/19.
//  Copyright © 2019 Ilya Usikov. All rights reserved.
//

import Foundation

protocol PostProtocol {
    var id: Int {get}
    var title: String {get set}
}

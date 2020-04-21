//
//  Customer.swift
//  TinhDienNuoc
//
//  Created by Nguyen Tien Cong on 3/13/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Customerr : Object {
    enum Property: String {
        case id, userName, passWord, name, age, address , phoneNumber
    }
    
    dynamic var id = UUID().uuidString
    dynamic var userName = ""
    dynamic var passWord = ""
    dynamic var name = ""
    dynamic var age = ""
    dynamic var address = ""
    dynamic var phoneNumber = ""
    dynamic var isCompleted = false
    
    override static func primaryKey() -> String? {
        return Customerr.Property.id.rawValue
    }
    
//    convenience init(_ name: String) {
//        self.init()
//        self.name = name
//    }
    
}

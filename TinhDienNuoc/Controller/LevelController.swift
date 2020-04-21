//
//  LevelController.swift
//  TinhDienNuoc
//
//  Created by Nguyen Tien Cong on 3/12/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation
func LevelController ( kWh : Float ) -> String {
    var level : String = ""
    if kWh <= 50 {
        level = "level: 1"
    }
    
    if ( kWh > 50 && kWh <= 100 ){
        level = "level: 2"
    }
    
    if ( kWh > 100 && kWh <= 200 ){
        level = "level: 3"
    }
    
    if ( kWh > 200 && kWh <= 300 ){
        level = "level: 4"
    }
    
    if ( kWh > 300 && kWh <= 400 ){
        level = "level: 5"
    }
    
    if kWh > 400 {
        level = "level: 6"
    }
    return level
}

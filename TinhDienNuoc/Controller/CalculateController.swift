//
//  CalculateController.swift
//  TinhDienNuoc
//
//  Created by Nguyen Tien Cong on 3/12/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation
import UIKit

func CalculateController( kWh : Float) -> Float {
    var price : Float = 0
    var level : Int = 0
    
    if kWh <= 50 {
        price = kWh*1678
    }
    
    if ( kWh > 50 && kWh <= 100 ){
        price = 83900 + (kWh - 50)*1734
    }
    
    if ( kWh > 100 && kWh <= 200 ){
        price = 170600 + (kWh - 100)*2014
    }
    
    if ( kWh > 200 && kWh <= 300 ){
        price = 372000 + (kWh - 200)*2536
    }
    
    if ( kWh > 300 && kWh <= 400 ){
        price = 625600 + (kWh - 300)*2834
    }
    
    if kWh > 400 {
        price = 909000 + (kWh - 400)*2927
    }
    price = price + 0.1*price
    return price
}

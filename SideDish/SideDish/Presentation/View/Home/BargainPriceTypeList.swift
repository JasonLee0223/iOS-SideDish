//
//  BargainPriceTypeList.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import Foundation

enum BargainPriceTypeList: String, CustomStringConvertible {
    case best = "BEST"
    case new = "NEW"
    case season = "계절특가"
    
    var description: String {
        return self.rawValue
    }
}

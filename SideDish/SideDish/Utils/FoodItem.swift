//
//  FoodItem.swift
//  SideDish
//
//  Created by Jason on 2023/04/30.
//

import Foundation

struct Information: Hashable {
    let foodName: String
    let foodDescription: String
}

struct Cost: Hashable {
    let primeCost: String
    let saleCost: String
}

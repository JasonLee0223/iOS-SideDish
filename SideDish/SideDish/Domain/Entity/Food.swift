//
//  Food.swift
//  SideDish
//
//  Created by Jason on 2023/04/30.
//

import Foundation

struct Food: FoodItem, Hashable {
    let foodCode: String
    let foodImage: Data
    let foodInformation: Information
    let cost: Cost
    let badge: [String]?
}

internal struct Information: Hashable {
    let foodName: String
    let foodDescription: String
}

internal struct Cost: Hashable {
    let primeCost: String
    let saleCost: String
}

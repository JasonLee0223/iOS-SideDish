//
//  FoodItem.swift
//  SideDish
//
//  Created by Jason on 2023/04/30.
//

import Foundation
import UIKit

protocol FoodItem {
    var foodImage: UIImage { get }
    var foodName: Information { get }
    var foodDescription: Information { get }
    var primeCost: Cost { get }
    var saleCost: Cost { get }
}

struct Information: Hashable {
    let foodName: String
    let foodDescription: String
}

struct Cost: Hashable {
    let primeCost: String
    let saleCost: String
}

//
//  Food.swift
//  SideDish
//
//  Created by Jason on 2023/04/30.
//

import Foundation
import UIKit

struct Food: FoodItem, Hashable {
    var foodImage: UIImage
    var foodName: Information
    var foodDescription: Information
    var primeCost: Cost
    var saleCost: Cost
}

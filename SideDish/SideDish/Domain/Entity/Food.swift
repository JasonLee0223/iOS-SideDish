//
//  Food.swift
//  SideDish
//
//  Created by Jason on 2023/04/30.
//

import Foundation
import UIKit

class Food: FoodItem {
    var foodImage: UIImage
    var foodName: Information
    var foodDescription: Information
    var primeCost: Cost
    var saleCost: Cost
    
    init(foodImage: UIImage, foodName: Information, foodDescription: Information,
         primeCost: Cost, saleCost: Cost) {
        self.foodImage = foodImage
        self.foodName = foodName
        self.foodDescription = foodDescription
        self.primeCost = primeCost
        self.saleCost = saleCost
    }
}

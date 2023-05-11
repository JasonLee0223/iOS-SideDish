//
//  Food.swift
//  SideDish
//
//  Created by Jason on 2023/04/30.
//

import Foundation
import UIKit

struct Food: FoodItem, Hashable {
    var foodImage: UIImage?
    var foodInformation: Information
    var cost: Cost
}

//
//  HomeFoodItem.swift
//  SideDish
//
//  Created by Jason on 2023/06/13.
//

import UIKit

protocol FoodItem {
    var foodImage: UIImage? { get }
    var foodInformation: Information { get }
    var cost: Cost { get }
}

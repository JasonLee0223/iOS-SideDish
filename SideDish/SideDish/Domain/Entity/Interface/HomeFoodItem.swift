//
//  HomeFoodItem.swift
//  SideDish
//
//  Created by Jason on 2023/06/13.
//

import Foundation

protocol FoodItem {
    var foodImage: Data { get }
    var foodInformation: Information { get }
    var cost: Cost { get }
}

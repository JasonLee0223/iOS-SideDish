//
//  DetailFoodInfromationDTO.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

struct DetailFoodInfromationDTO: Decodable {
    let topImage: String
    let thumbImages: [String]
    let productDescription: String
    let point: String
    let deliveryInfo: String
    let deliveryFee: String
    let prices: [String]
    let detailSection: [String]
}

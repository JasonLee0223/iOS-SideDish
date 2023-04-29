//
//  FoodInformationDTO.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

struct FoodInformationDTO: Decodable {
    let detailHash: String
    let foodImage: String
    let alternative: String
    let deliveryType: [DeliveryType]
    let title: String
    let bodyDescription: String
    let normalPrice: String?
    let salePrice: String
    let badge: [String]?
    
    enum CodingKeys: String, CodingKey {
        case detailHash
        case foodImage = "image"
        case alternative = "alt"
        case deliveryType
        case title
        case bodyDescription
        case normalPrice = "nPrice"
        case salePrice = "sPrice"
        case badge
    }
}

enum DeliveryType: Decodable {
    case 새벽배송
    case 전국택배
}

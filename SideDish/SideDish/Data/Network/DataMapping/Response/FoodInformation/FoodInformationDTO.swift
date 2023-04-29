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
    let description: String
    let normalPrice: String?
    let salePrice: String?
    let badge: [String]?
    
    enum CodingKeys: String, CodingKey {
        case detailHash = "detail_hash"
        case foodImage = "image"
        case alternative = "alt"
        case deliveryType = "delivery_type"
        case title
        case description
        case normalPrice = "n_Price"
        case salePrice = "s_Price"
        case badge
    }
}

enum DeliveryType: String, Decodable {
    case 새벽배송
    case 전국택배
}

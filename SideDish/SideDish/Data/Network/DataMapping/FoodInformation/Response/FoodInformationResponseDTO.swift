//
//  FoodInformationResultDTO.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

struct FoodInformationResultDTO {
    let statusCode: Int
    let FoodInformationDTO: [FoodInformationDTO]
    
    enum CodingKeys: String, CodingKey {
        case statusCode
        case FoodInformationDTO = "body"
    }
}

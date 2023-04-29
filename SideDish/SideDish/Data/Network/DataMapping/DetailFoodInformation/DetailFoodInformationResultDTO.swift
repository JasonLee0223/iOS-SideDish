//
//  DetailFoodInformationResultDTO.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

struct DetailFoodInformationResultDTO {
    let hash: String
    let detailFoodInfromationDTO: DetailFoodInfromationDTO
    
    enum CodingKeys: String, CodingKey {
        case hash
        case detailFoodInfromationDTO = "data"
    }
}

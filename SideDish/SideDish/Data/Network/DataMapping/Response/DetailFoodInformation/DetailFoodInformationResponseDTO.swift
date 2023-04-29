//
//  DetailFoodInformationResponseDTO.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

struct DetailFoodInformationResponseDTO: Decodable {
    let hash: String
    let data: DetailFoodInfromationDTO
    
    enum CodingKeys: String, CodingKey {
        case hash
        case data = "data"
    }
}

//
//  FoodInformationResponseDTO.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

struct FoodInformationResponseDTO: Decodable {
    let statusCode: Int
    let body: [FoodInformationDTO]
}

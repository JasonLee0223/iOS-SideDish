//
//  APIEndpoint.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

struct APIEndpoint {
    static func supplyFoodInformation(with receivedPath: String) -> Endpoint<FoodInformationResponseDTO> {
        return Endpoint(baseURL: APIMagicLiteral.baseURL, path: receivedPath)
    }
    
    static func supplyDetailFoodInformation(with receivedPath: String, and receivedSubPath: String) -> Endpoint<DetailFoodInformationResponseDTO> {
        return Endpoint(baseURL: APIMagicLiteral.baseURL, path: receivedPath, subPath: receivedSubPath)
    }
}

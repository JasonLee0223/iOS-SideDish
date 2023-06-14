//
//  ErrorOfHomeViewModel.swift
//  SideDish
//
//  Created by Jason on 2023/06/14.
//

import Foundation

enum ErrorOfHomeViewModel: LocalizedError {
    case WrongCountToNumberOfItemsInSection
    case EmptyOfOpenAPIData
    case EmptyOfImageData
    case FailOfMakeURL
    
    var errorDescription: String {
        switch self {
        case .WrongCountToNumberOfItemsInSection:
            return "❌ \(#function): Wrong Count To Number Of Items In Section"
        case .EmptyOfOpenAPIData:
            return "❌ \(#function): Empty of Open API Data"
        case .EmptyOfImageData:
            return "❌ \(#function): Empty of Image Data because URL haven't image raw data"
        case .FailOfMakeURL:
            return "❌ \(#function): Fail of Make URL"
        }
    }
}

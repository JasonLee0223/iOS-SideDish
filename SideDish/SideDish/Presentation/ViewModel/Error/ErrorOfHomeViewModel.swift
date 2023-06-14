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
    case FailOfMakeURL
    
    var errorDescription: String {
        switch self {
        case .WrongCountToNumberOfItemsInSection:
            return "❌ \(#function): Wrong Count To Number Of Items In Section"
        case .EmptyOfOpenAPIData:
            return "❌ \(#function): Empty of Open API Data"
        case .FailOfMakeURL:
            return "❌ \(#function): Fail of Make URL"
        }
    }
}

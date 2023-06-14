//
//  HomeViewModel.swift
//  SideDish
//
//  Created by Jason on 2023/06/14.
//

import Foundation

final class HomeViewModel {
    
    var sectionStorage: [Section: Observable<[Food]>]
    
    init() {
        networkService = NetworkService()
        
        sectionStorage = [.main: Observable<[Food]>(), .soup: Observable<[Food]>(), .side: Observable<[Food]>()]
    }
    
    private let networkService: NetworkService
}

//MARK: - Use of DataSource
extension HomeViewModel {
    
    func fetchOfData() {
        
        Section.allCases.forEach { section in
            Task(priority: .background) {
                await loadAllData(with: section)
            }
        }
    }
    
    private func loadAllData(with section: Section) async {
        var foods = [Food]()
        
        do {
            let networkResult = try await networkService.request(
                with: APIEndpoint.supplyFoodInformation(with: section.offerMenuName)
            ).body
            
            for foodInformationDTO in networkResult {
                guard let imageURL = URL(string: foodInformationDTO.foodImage) else {
                    return
                }
                
                let imageData = try Data(contentsOf: imageURL)
                
                let food = Food(
                    foodImage: imageData,
                    foodInformation: Information(
                        foodName: foodInformationDTO.title,
                        foodDescription: foodInformationDTO.description
                    ),
                    cost: Cost(
                        primeCost: foodInformationDTO.normalPrice ?? "",
                        saleCost: foodInformationDTO.salePrice ?? ""
                    )
                )
                foods.append(food)
            }
            
        } catch {
            print("Empty API Data")
        }
        
        sectionStorage[section]?.value = foods
    }
}

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
    
    func countOfSection() -> Int {
        return sectionStorage.count
    }
    
    func countItem(of sectionNumber: Int) async throws -> Int {
        
        let sectionType = Section.allCases[sectionNumber]
        
        guard let items = sectionStorage[sectionType]?.value else {
            throw ErrorOfHomeViewModel.WrongCountToNumberOfItemsInSection
        }
        
        return items.count
    }
    
    func fetchOfData() {
        
        Section.allCases.forEach { section in
            Task(priority: .background) {
                try await loadAllData(with: section)
            }
        }
    }
    
    private func loadAllData(with section: Section) async throws {
        var foods = [Food]()
        
        do {
            let networkResult = try await networkService.request(
                with: APIEndpoint.supplyFoodInformation(with: section.offerMenuName)
            ).body
            
            for foodInformationDTO in networkResult {
                guard let imageURL = URL(string: foodInformationDTO.foodImage) else {
                    throw ErrorOfHomeViewModel.FailOfMakeURL
                }
                
                let imageData = try Data(contentsOf: imageURL)
                
                let food = Food(
                    foodImage: imageData, foodInformation: Information(
                        foodName: foodInformationDTO.title,
                        foodDescription: foodInformationDTO.description
                    ), cost: Cost(
                        primeCost: foodInformationDTO.normalPrice ?? "",
                        saleCost: foodInformationDTO.salePrice ?? ""
                    )
                )
                foods.append(food)
            }
        } catch {
            print(ErrorOfHomeViewModel.EmptyOfOpenAPIData.errorDescription)
        }
        
        sectionStorage[section]?.value = foods
    }
}

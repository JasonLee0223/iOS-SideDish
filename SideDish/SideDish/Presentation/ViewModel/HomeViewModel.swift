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
        
        sectionStorage = [
            .main: Observable<[Food]>(),
            .soup: Observable<[Food]>(),
            .side: Observable<[Food]>()
        ]
}
    
    private let networkService: NetworkService
}

//MARK: - Use of DataSource
extension HomeViewModel {
    
    func countOfSection() -> Int {
        return sectionStorage.count
    }
    
    func countOfItemsInSection(with sectionNumber: Int) async -> Int {
        guard let sectionType = Section(rawValue: sectionNumber) else {
            return 0
        }
        
        guard let bindModels = sectionStorage[sectionType]?.value else {
            return 0
        }
        
        return bindModels.count
    }
        
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
                let imagePath = foodInformationDTO.foodImage
                
                if foodInformationDTO.title == "두부조림" {
                    let checkImagePath = imagePath.dropLast(4)
                    let verifyImagePath = String(checkImagePath)
                    
                    try makeFoodEntity(with: verifyImagePath,
                                       foodInformationDTO: foodInformationDTO) { foodEntity in
                        foods.append(foodEntity)
                    }
                } else {
                    try makeFoodEntity(with: imagePath,
                                       foodInformationDTO: foodInformationDTO) { foodEntity in
                        foods.append(foodEntity)
                    }
                }
            }
        } catch {
            print(ErrorOfHomeViewModel.EmptyOfOpenAPIData.errorDescription)
        }
        
        sectionStorage[section]?.value = foods
    }
    
    private func makeFoodEntity(with foodName: String,
                                foodInformationDTO: FoodInformationDTO,
                                completion: (Food) -> Void) throws {
        guard let imageURL = URL(string: foodName) else {
            throw ErrorOfHomeViewModel.FailOfMakeURL
        }
        
        guard let imageData = try? Data(contentsOf: imageURL) else {
            throw ErrorOfHomeViewModel.EmptyOfImageData
        }
        
        let food = Food(
            foodImage: imageData, foodInformation: Information(
                foodName: foodInformationDTO.title,
                foodDescription: foodInformationDTO.description
            ), cost: Cost(
                primeCost: foodInformationDTO.normalPrice ?? "",
                saleCost: foodInformationDTO.salePrice ?? ""
            )
        )
        completion(food)
    }
}

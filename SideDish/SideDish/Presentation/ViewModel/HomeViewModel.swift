//
//  HomeViewModel.swift
//  SideDish
//
//  Created by Jason on 2023/06/14.
//

import Foundation

final class HomeViewModel {
    
    var itemsInSection = 0
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
    
    func getFoodInfo(with section: Section, indexPath: IndexPath) async throws -> Food {
        
        guard let foods = sectionStorage[section]?.value else {
            throw ErrorOfHomeViewModel.EmptyOfOpenAPIData
        }
        
        return foods[indexPath.row]
    }
}

//MARK: - Fetch
extension HomeViewModel {
    
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
        itemsInSection = foods.count
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
            foodCode: foodInformationDTO.detailHash,
            foodImage: imageData, foodInformation: Information(
                foodName: foodInformationDTO.title,
                foodDescription: foodInformationDTO.description
            ), cost: Cost(
                primeCost: foodInformationDTO.normalPrice ?? "",
                saleCost: foodInformationDTO.salePrice ?? ""
            ), badge: foodInformationDTO.badge
        )
        completion(food)
    }
}

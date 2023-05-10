//
//  HomeCollectionViewDataSource.swift
//  SideDish
//
//  Created by Jason on 2023/05/06.
//

import UIKit

enum Section: Int, CaseIterable {
    case main = 0
    case soup
    case sideDish
    
    var headerTitle: String {
        switch self {
        case .main: return "모두가 좋아하는 \n든든한 메인 요리"
        case .soup: return "정선이 담긴 \n뜨끈뜨끈 국물 요리"
        case .sideDish: return "식탁을 풍성하게 하는 정갈한 밑반찬"
        }
    }
}

final class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var headers: [Section] = [Section.main, Section.soup, Section.sideDish]
    
    private var foods: [Section: [Food]] = [:]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return headers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.headers[section] {
        case .main:
            return foods[Section.main]?.count ?? 0
        case .soup:
            return foods[Section.soup]?.count ?? 0
        case .sideDish:
            return foods[Section.sideDish]?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HomeHeaderView.identifier,
                for: indexPath) as? HomeHeaderView else {
                return UICollectionReusableView()
            }
            
            headerView.setTitle(headerText: headers[indexPath.section].headerTitle)
            return headerView
        default:
            assert(false, "Invalid UICollectionReusableView")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeViewCell.identifier, for: indexPath) as? HomeViewCell else {
            return UICollectionViewCell()
        }
        
        print(self.headers[indexPath.section])
        
        switch self.headers[indexPath.section] {
        case .main:
            return configure(cell: cell, food: foods[Section.main]?[indexPath.row])
        case .soup:
            return configure(cell: cell, food: foods[Section.soup]?[indexPath.row])
        case .sideDish:
            return configure(cell: cell, food: foods[Section.sideDish]?[indexPath.row])
            
        }
    }
    
    private func configure(cell: HomeViewCell, food: Food?) -> HomeViewCell {
        guard let food = food else { return HomeViewCell() }
//        setImage(cell: cell, by: food.foodImage)
//        cell.foodInformationStackView.setTitle(by: food.foodInformation.foodName)
//        cell.foodInformationStackView.setDescription(by: food.foodInformation.foodDescription)
//        cell.foodInformationStackView.setPrimeCost(by: food.cost.primeCost)
//        cell.foodInformationStackView.setDiscountedCost(by: food.cost.saleCost)
//        cell.menuStackView.setBadges(by: food)
        
//        setImage(cell: cell, by: food.foodImage)
        cell.foodInformationStackView.setTitle(by: "food.foodInformation.foodName")
        cell.foodInformationStackView.setDescription(by: "food.foodInformation.foodDescription")
        cell.foodInformationStackView.setPrimeCost(by: "food.cost.primeCost")
        cell.foodInformationStackView.setDiscountedCost(by: "food.cost.saleCost")
//        cell.menuStackView.setBadges(by: food)
        return cell
    }
    
    //TODO: - Image 다운로드 및 Configure
}

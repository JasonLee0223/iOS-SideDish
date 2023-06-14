//
//  HomeCollectionViewDataSource.swift
//  SideDish
//
//  Created by Jason on 2023/05/06.
//

import UIKit

final class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var headers: [Section] = [Section.main, Section.soup, Section.side]
    
    private var foods: [Section: [Food]] = [:]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        switch self.headers[section] {
        case .main:
            return foods[Section.main]?.count ?? 0
        case .soup:
            return foods[Section.soup]?.count ?? 0
        case .side:
            return foods[Section.side]?.count ?? 0
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
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeViewCell.identifier, for: indexPath
        ) as? HomeViewCell else {
            return UICollectionViewCell()
        }
        
        print(headers[indexPath.section])
        
        switch self.headers[indexPath.section] {
        case .main:
            return configure(cell: cell, food: foods[Section.main]?[indexPath.row])
        case .soup:
            return configure(cell: cell, food: foods[Section.soup]?[indexPath.row])
        case .side:
            return configure(cell: cell, food: foods[Section.side]?[indexPath.row])
        }
    }
    
    private func configure(cell: HomeViewCell, food: Food?) -> HomeViewCell {
        guard let food = food else { return HomeViewCell() }
        
        cell.setFoodImage(image: food.foodImage!)
        cell.foodInformationStackView.setTitle(by: food.foodInformation.foodName)
        cell.foodInformationStackView.setDescription(by: food.foodInformation.foodDescription)
        cell.foodInformationStackView.setPrimeCost(by: food.cost.primeCost)
        cell.foodInformationStackView.setDiscountedCost(by: food.cost.saleCost)
//        cell.menuStackView.setBadges(by: food)
        return cell
    }
    
    func fetch(foods: [Food], section: Section) {
        self.foods[section] = foods
    }
    
    //TODO: - Image 다운로드 및 Configure
}

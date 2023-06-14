//
//  HomeCollectionViewDataSource.swift
//  SideDish
//
//  Created by Jason on 2023/05/06.
//

import UIKit

final class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    override init() {
        homeViewModel = HomeViewModel()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeViewModel.countOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        var verifyToItemsCount = 0
        
        Task {
            verifyToItemsCount  = try await homeViewModel.countItem(of: section)
        }
        
        return verifyToItemsCount
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
            
            Section.allCases.forEach { _ in
                headerView.setTitle(headerText: Section(rawValue: indexPath.section)?.headerTitle)
            }
            
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
        
        Section.allCases.forEach { section in
            
            homeViewModel.fetchOfData()
            
            guard let foods = homeViewModel.sectionStorage[section]?.value else {
                return
            }
            
            foods.forEach { food in
                configure(cell: cell, food: food)
                collectionView.reloadData()
            }
        }
        return cell
    }
    
    private func configure(cell: HomeViewCell, food: Food) {
        guard let foodImage = UIImage(data: food.foodImage) else {
            return
        }
        
        cell.setFoodImage(image: foodImage)
        cell.foodInformationStackView.setTitle(by: food.foodInformation.foodName)
        cell.foodInformationStackView.setDescription(by: food.foodInformation.foodDescription)
        cell.foodInformationStackView.setPrimeCost(by: food.cost.primeCost)
        cell.foodInformationStackView.setDiscountedCost(by: food.cost.saleCost)
//        cell.menuStackView.setBadges(by: food)
    }
    
    let homeViewModel: HomeViewModel
}

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
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: HomeHeaderView.identifier, for: indexPath) as? HomeHeaderView else {
                return UICollectionReusableView()
            }
            
            headerView.setTitle(headerText: Section(rawValue: indexPath.section)?.headerTitle)
            
            return headerView
        default:
            assert(false, "Invalid UICollectionReusableView")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeViewCell.identifier, for: indexPath) as? HomeViewCell else {
            return UICollectionViewCell()
        }
        
        guard let sectionType = Section(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        Task {
            let getFood = try await homeViewModel.getFoodInfo(with: sectionType, indexPath: indexPath)
            cell.configure(of: getFood)
        }
        
        return cell
    }
    
    let homeViewModel: HomeViewModel
}

//
//  HomeViewController.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let networkService = NetworkService()
    let homeCollectionViewDataSource = HomeCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureOfSuperViewLayout()
        
    }
    
    //MARK: - Private Property
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: configureOfCollectionViewLayout())
        collectionView.showsVerticalScrollIndicator = true
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = .systemOrange
        collectionView.dataSource = homeCollectionViewDataSource
        
        collectionView.register(HomeHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HomeHeaderView.identifier)
        
        collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: HomeViewCell.identifier)
        
        return collectionView
    }()
}
        
//MARK: - Configure Of Layout
extension HomeViewController {
    private func configureOfSuperViewLayout() {
        let superViewSafeArea = self.view.safeAreaLayoutGuide
        self.view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: superViewSafeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: superViewSafeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: superViewSafeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: superViewSafeArea.bottomAnchor)
        ])
    }
    
    private func configureOfCollectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(343),
                                              heightDimension: .absolute(130))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(343),
                                               heightDimension: .estimated(1200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

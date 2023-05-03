//
//  HomeViewController.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            try await networkService.request(with: APIEndpoint.supplyFoodInformation(with: APIMagicLiteral.main))
        }
    //MARK: - Private Property
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewLayout())
        collectionView.showsVerticalScrollIndicator = true
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = .yellow
        return collectionView
    }()
//MARK: - Configure Of Layout
extension HomeViewController {
    private func configureOfSuperViewLayout() {
        let superViewSafeArea = self.view.safeAreaLayoutGuide
        self.view.addSubview(collectionView)
        
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


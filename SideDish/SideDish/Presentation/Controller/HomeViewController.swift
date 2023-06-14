//
//  HomeViewController.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeCollectionViewDataSource = HomeCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureOfUIComponents()
        
        configureOfSuperViewLayout()
        
        homeCollectionViewDataSource.homeViewModel.fetchOfData()
    }
    
    //MARK: - Private Property
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: configreOfCollectionViewFlowLayout()
        )
        collectionView.showsVerticalScrollIndicator = true
        collectionView.clipsToBounds = true
        collectionView.dataSource = homeCollectionViewDataSource
        
        collectionView.register(
            HomeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HomeHeaderView.identifier
        )
        
        collectionView.register(
            HomeViewCell.self, forCellWithReuseIdentifier: HomeViewCell.identifier
        )
        
        return collectionView
    }()
}

//MARK: - Configure of UI Components
extension HomeViewController {
    
    private func configureOfUIComponents() {
        configureOfSuperView()
        configureOfNavigationBar()
    }
    
    private func configureOfSuperView() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureOfNavigationBar() {
        navigationItem.title = "Ordering"
    }
}
        
//MARK: - Configure of Layout
extension HomeViewController {
    
    private func configureOfSuperViewLayout() {
        let superViewSafeArea = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: superViewSafeArea.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: superViewSafeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: superViewSafeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: superViewSafeArea.trailingAnchor)
        ])
    }
}

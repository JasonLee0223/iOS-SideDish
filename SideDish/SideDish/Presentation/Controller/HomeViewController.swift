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
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero, collectionViewLayout: UICollectionViewLayout()
    )
}

//MARK: - Configure of UI Components
extension HomeViewController {
    
    private func configureOfUIComponents() {
        configureOfSuperView()
        configureOfNavigationBar()
        configureOfCollectionView()
        updateDataSource()
    }
    
    private func configureOfSuperView() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureOfNavigationBar() {
        navigationItem.title = "Ordering"
    }
    
    private func configureOfCollectionView() {
        
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.clipsToBounds = true
        collectionView.collectionViewLayout = configreOfCollectionViewFlowLayout()
        
        collectionView.register(
            HomeHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HomeHeaderView.identifier
        )
        
        collectionView.register(
            HomeViewCell.self, forCellWithReuseIdentifier: HomeViewCell.identifier
        )
    }
    
    private func updateDataSource() {
        Task(priority: .high) {
            collectionView.dataSource = homeCollectionViewDataSource
        }
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
    
    func configreOfCollectionViewFlowLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let headerSize = CGSize(width: self.view.frame.width, height: 130)
        let itemSize = CGSize(width:self.view.frame.width, height: 130)
        layout.headerReferenceSize = headerSize
        layout.itemSize = itemSize
        return layout
    }
}

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
        fetchData()
    }
    
    private lazy var navigationBar : UINavigationBar = {
        let navigationBar = UINavigationBar()
        let navigationItem = UINavigationItem(title: "Ordering")
        navigationBar.setItems([navigationItem], animated: true)
        navigationBar.isTranslucent = false

        return navigationBar
    }()
    
    //MARK: - Private Property
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configreOfCollectionViewFlowLayout())
        collectionView.showsVerticalScrollIndicator = true
        collectionView.clipsToBounds = true
        collectionView.dataSource = homeCollectionViewDataSource
        
        collectionView.register(HomeHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HomeHeaderView.identifier)
        
        collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: HomeViewCell.identifier)
        
        return collectionView
    }()
}
        
//MARK: - Configure of Layout
extension HomeViewController {
    private func configureOfSuperViewLayout() {
        let superViewSafeArea = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: superViewSafeArea.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: superViewSafeArea.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: superViewSafeArea.trailingAnchor)
        ])
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: superViewSafeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor)
        ])
    }
    
    private func configreOfCollectionViewFlowLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let headerSize = CGSize(width: self.view.frame.width, height: 130)
        let itemSize = CGSize(width:self.view.frame.width, height: 130)
        layout.headerReferenceSize = headerSize
        layout.itemSize = itemSize
        return layout
    }
    
    private func configureOfCollectionViewCompositionalLayout() -> UICollectionViewLayout {
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

//MARK: - Configure of NetworkService
extension HomeViewController {
    
    private func fetchData() {
        
        Section.allCases.forEach { section in
            
            Task {
                let apiData = try await networkService.request(with: APIEndpoint.supplyFoodInformation(with: section.offerMenuName)).body
                var foodDataStorage = [Food]()
                
                apiData.forEach { foodInformationDTO in
                    
                    let foodData = Food(foodImage: UIImage(systemName: "star.fill"),
                                        foodInformation: Information(foodName: foodInformationDTO.title,
                                                                     foodDescription: foodInformationDTO.description),
                                        cost: Cost(primeCost: foodInformationDTO.normalPrice ?? "",
                                                   saleCost: foodInformationDTO.salePrice ?? ""))
                    foodDataStorage.append(foodData)
                }
                
                switch section {
                case .main:
                    print(foodDataStorage.count, section)
                    self.homeCollectionViewDataSource.fetch(menus: foodDataStorage, section: section)
                    self.collectionView.reloadData()
                case .soup:
                    print(foodDataStorage.count, section)
                    self.homeCollectionViewDataSource.fetch(menus: foodDataStorage, section: section)
                    self.collectionView.reloadData()
                case .sideDish:
                    print(foodDataStorage.count, section)
                    self.homeCollectionViewDataSource.fetch(menus: foodDataStorage, section: section)
                    self.collectionView.reloadData()
                }
            }
            
        }
    }
    
}

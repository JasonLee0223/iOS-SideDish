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
        
        configureOfUIComponents()
        
        configureOfSuperViewLayout()
        fetchData()
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

//MARK: - Configure of NetworkService
extension HomeViewController {
    
    private func fetchData() {
        
        Section.allCases.forEach { section in
            
            Task {
                let networkResult = try await networkService.request(
                    with: APIEndpoint.supplyFoodInformation(
                        with: section.offerMenuName
                    )
                ).body
                
                var foodDataStorage = [Food]()
                
                for result in networkResult {
                    guard let imageURL = URL(string: result.foodImage) else {
                        return
                    }
                    
                    let imageData = try Data(contentsOf: imageURL)
                    
                    let makeFoodItem = Food(
                        foodImage: imageData,
                        foodInformation: Information(
                            foodName: result.title,
                            foodDescription: result.description
                         ),
                        cost: Cost(
                            primeCost: result.normalPrice ?? "",
                            saleCost: result.salePrice ?? ""
                         )
                    )
                    
                    foodDataStorage.append(makeFoodItem)
                }
                
                print(section)
                
                switch section {
                case .main:
                    self.homeCollectionViewDataSource.fetch(foods: foodDataStorage, section: section)
                    self.collectionView.reloadData()
                case .soup:
                    self.homeCollectionViewDataSource.fetch(foods: foodDataStorage, section: section)
                    self.collectionView.reloadData()
                case .side:
                    self.homeCollectionViewDataSource.fetch(foods: foodDataStorage, section: section)
                    self.collectionView.reloadData()
                }
            }
        }
        
    }
    
}

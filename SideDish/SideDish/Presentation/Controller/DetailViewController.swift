//
//  DetailViewController.swift
//  SideDish
//
//  Created by Jason on 2023/06/17.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var detailFoodCode: String?
    
    override func viewWillAppear(_ animated: Bool) {
        if animated {
            guard let unwrappingFoodCode = detailFoodCode else {
                return
            }
            
            Task {
                let networkResult = try await networkService.request(
                    with: APIEndpoint.supplyDetailFoodInformation(
                        with: APIMagicLiteral.detail, and: unwrappingFoodCode)
                ).data
                print(networkResult)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configuerOfUI()
        configureHierarchy()
    }
    
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero, collectionViewLayout: UICollectionViewLayout()
    )
    
    private let networkService = NetworkService()
}

//MARK: - Configure of UI Components
extension DetailViewController {
    
    private func configuerOfUI() {
        configureOfCollectionView()
    }
    
    private func configureOfCollectionView() {
        collectionView.backgroundColor = .systemGray
    }
}

//MARK: - Configure of Layout
extension DetailViewController {
    
    private func configureHierarchy() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}

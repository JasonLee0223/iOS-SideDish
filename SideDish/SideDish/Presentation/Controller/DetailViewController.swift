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
        
    }
    
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero, collectionViewLayout: UICollectionViewLayout()
    )
    
    private let networkService = NetworkService()
}

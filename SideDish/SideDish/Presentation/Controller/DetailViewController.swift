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
        
        configureHierarchy()
    }
    
    private let networkService = NetworkService()
    
    private let detailFoodInformation = DetailFoodInformation(frame: .zero)
}

//MARK: - Configure of UI Components
extension DetailViewController {
    
    private func configuerOfUI() {
        
    }
}

//MARK: - Configure of Layout
extension DetailViewController {
    
    private func configureHierarchy() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(detailFoodInformation)
        detailFoodInformation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailFoodInformation.topAnchor.constraint(equalTo: safeArea.topAnchor),
            detailFoodInformation.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            detailFoodInformation.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            detailFoodInformation.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}

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
                //TODO: - 음식 제목 및 badge 필요
                
                print(networkResult)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureHierarchy()
    }
    
    private let networkService = NetworkService()

    private let productInformation = ProductInformation(frame: .zero)
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
        
        self.view.addSubview(productInformation)
        productInformation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productInformation.topAnchor.constraint(equalTo: safeArea.topAnchor),
            productInformation.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            productInformation.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            productInformation.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

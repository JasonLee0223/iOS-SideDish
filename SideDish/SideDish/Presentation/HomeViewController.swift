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
    }
}


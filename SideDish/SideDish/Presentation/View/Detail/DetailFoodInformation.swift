//
//  DetailFoodInformation.swift
//  SideDish
//
//  Created by Jason on 2023/06/22.
//

import UIKit

//MARK: - Top Class
class DetailFoodInformation: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray
        configureOfLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private let foodThumbScroll = FoodThumbImages()
    private let foodInformation = FoodInformation()
}

//MARK: - Configure of Layout
extension DetailFoodInformation {
    
    private func configureOfLayout() {
        self.addSubview(foodThumbScroll)
        foodThumbScroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodThumbScroll.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            foodThumbScroll.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            foodThumbScroll.heightAnchor.constraint(equalToConstant: 376),
        ])
    }
}

//
//  ProductInformation.swift
//  SideDish
//
//  Created by Jason on 2023/06/22.
//

import UIKit

//MARK: - Top Class
class ProductInformation: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray
        configureOfLayout()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private let foodThumbScroll = FoodThumbImages()
    private let detailFoodInfo = DetailFoodInfo()
    
    private func setUp() {
        let foodInfo = ["오리 주물럭_반조리", "감칠맛 나는 매콤한 양념", "12,640", "15,800", "런칭특가"]
        detailFoodInfo.configureOfFoodInfoUIComponents(foodInfo: foodInfo)
    }
}

//MARK: - Configure of Layout
extension ProductInformation {
    
    private func configureOfLayout() {
        self.addSubview(foodThumbScroll)
        foodThumbScroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodThumbScroll.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            foodThumbScroll.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            foodThumbScroll.heightAnchor.constraint(equalToConstant: 376),
        ])
        
        self.addSubview(detailFoodInfo)
        detailFoodInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailFoodInfo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            detailFoodInfo.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            detailFoodInfo.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            detailFoodInfo.heightAnchor.constraint(equalToConstant: 152)
        ])
    }
}

//
//  DetailFoodInfo.swift
//  SideDish
//
//  Created by Jason on 2023/06/22.
//

import UIKit

class DetailFoodInfo: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureOfStackView()
        configureOfLayout()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureOfStackView()
        configureOfLayout()
    }
    
    private let costGroup: UIStackView = {
        let costGroup = UIStackView()
        costGroup.axis = .horizontal
        costGroup.alignment = .leading
        costGroup.spacing = 8
        costGroup.distribution = .fill
        return costGroup
    }()
    
    private let foodTitle: UILabel = {
        let foodTitle = UILabel()
        foodTitle.font = .boldSystemFont(ofSize: 32)
        foodTitle.textColor = .black
        return foodTitle
    }()
    
    private let foodDescription: UILabel = {
        let foodDescription = UILabel()
        foodDescription.font = .systemFont(ofSize: 18)
        foodDescription.textColor = .systemGray2
        return foodDescription
    }()
    
    private let salePrice: UILabel = {
        let salePrice = UILabel()
        salePrice.font = .boldSystemFont(ofSize: 18)
        salePrice.textColor = .black
        salePrice.contentMode = .scaleToFill
        return salePrice
    }()
    
    private let primePrice: UILabel = {
        let primePrice = UILabel()
        primePrice.font = .systemFont(ofSize: 16)
        primePrice.textColor = .systemGray2
        return primePrice
    }()
    
    private let mockBadge: UILabel = {
        let mockBadge = UILabel()
        mockBadge.font = .systemFont(ofSize: 16)
        mockBadge.textColor = .black
        return mockBadge
    }()
}

extension DetailFoodInfo {
    
    private func configureOfLayout() {
        
        self.addArrangedSubview(foodTitle)
        self.addArrangedSubview(foodDescription)
        self.addArrangedSubview(costGroup)
        costGroup.addArrangedSubview(salePrice)
        costGroup.addArrangedSubview(primePrice)
        
        //TODO: - Badge 추가
        self.addArrangedSubview(mockBadge)
    }
}

//MARK: - [Public Method] Configure of UI Components
extension DetailFoodInfo {
    
    func setFoodTitle(by name: String) {
        foodTitle.text = name
    }
    
    func setFoodDescription(by text: String) {
        foodDescription.text = text
    }
    
    func setSalePrice(by text: String) {
        salePrice.text = text
    }
    
    func setPrimePrice(by text: String) {
        primePrice.text = text
    }
    
    func setMockBadge(by text: String) {
        mockBadge.text = text
    }
    
    //TODO: - Badge UI 추가
    
    private func configureOfStackView() {
        axis = .vertical
        alignment = .leading
        spacing = 8
        distribution = .fillProportionally
    }
}

//
//  DetailFoodInformation.swift
//  SideDish
//
//  Created by Jason on 2023/06/22.
//

import UIKit

class DetailFoodInformation: UIStackView, TextStylable {
    
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
    
    private let primePrice: UILabel = {
        let primePrice = UILabel()
        primePrice.font = .boldSystemFont(ofSize: 18)
        primePrice.textColor = .black
        primePrice.contentMode = .scaleToFill
        return primePrice
    }()
    
    private let salePrice: UILabel = {
        let salePrice = UILabel()
        salePrice.font = .systemFont(ofSize: 16)
        salePrice.textColor = .systemGray2
        return salePrice
    }()
    
    private var badgeStackView: UIStackView = {
        let badgeStackView = UIStackView()
        badgeStackView.axis = .horizontal
        badgeStackView.spacing = 4
        badgeStackView.distribution = .fillProportionally
        return badgeStackView
    }()
}

extension DetailFoodInformation {
    
    private func configureOfLayout() {
        
        self.addArrangedSubview(foodTitle)
        self.addArrangedSubview(foodDescription)
        self.addArrangedSubview(costGroup)
        costGroup.addArrangedSubview(primePrice)
        costGroup.addArrangedSubview(salePrice)
        self.addArrangedSubview(badgeStackView)
    }
}

//MARK: - [Public Method] Configure of UI Components
extension DetailFoodInformation {
    
    func setFoodTitle(by name: String) {
        foodTitle.text = name
    }
    
    func setFoodDescription(by text: String) {
        foodDescription.text = text
    }
    
    func setPrimePrice(by text: String) {
        primePrice.text = text
    }
    
    func setSalePrice(by text: String) {
        salePrice.text = text
        convertTextStyleToStrikethrough(from: salePrice)
    }
    
    func setMockBadge(by textGroup: [String]) {
        textGroup.forEach { text in
            switch BargainPriceTypeList(rawValue: text) {
            case .best:
                let badge = UILabel.makeBadge(
                    title: text, backgroundColor: UIColor.launchingBadgeBackground
                )
                badgeStackView.addArrangedSubview(badge)
            case .new:
                let badge = UILabel.makeBadge(
                    title: text, backgroundColor: UIColor.eventBadgeBackground
                )
                badgeStackView.addArrangedSubview(badge)
            case .season:
                let badge = UILabel.makeBadge(
                    title: text, backgroundColor: UIColor.defaultBadgeBackground
                )
                badgeStackView.addArrangedSubview(badge)
            case .none:
                return
            }
        }
        
    }
    
    //TODO: - Badge UI 추가
    
    private func configureOfStackView() {
        axis = .vertical
        alignment = .leading
        spacing = 8
        distribution = .fillProportionally
    }
}

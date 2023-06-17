//
//  FoodInformation.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit

final class FoodInformation: UIStackView {
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurationComponents()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Private Property
    
    private var foodInformationStackView: UIStackView = {
        let foodInformationStackView = UIStackView()
        foodInformationStackView.axis = .vertical
        foodInformationStackView.alignment = .leading
        foodInformationStackView.distribution = .fillEqually
        return foodInformationStackView
    }()
    
    private(set) var foodPriceStackView: UIStackView = {
        let foodPriceStackView = UIStackView()
        foodPriceStackView.axis = .horizontal
        foodPriceStackView.spacing = 4
        foodPriceStackView.distribution = .equalSpacing
        return foodPriceStackView
    }()
    
    private(set) var badgeStackView: UIStackView = {
        let badgeStackView = UIStackView()
        badgeStackView.axis = .horizontal
        badgeStackView.spacing = 4
        badgeStackView.distribution = .fillProportionally
        return badgeStackView
    }()
    
    private var foodTitle: UILabel = {
        let foodTitle = UILabel()
        foodTitle.font = .boldSystemFont(ofSize: 14)
        foodTitle.textColor = .black
        return foodTitle
    }()
    
    private var foodDescription: UILabel = {
        let foodDescription = UILabel()
        foodDescription.font = .systemFont(ofSize: 14)
        foodDescription.textColor = .systemGray2
        return foodDescription
    }()
    
    private var primeCostContent: UILabel = {
        let primeCostContent = UILabel()
        primeCostContent.font = .boldSystemFont(ofSize: 14)
        primeCostContent.textColor = .black
        return primeCostContent
    }()
    
    private var discountedCostContent: UILabel = {
        let discountedCostContent = UILabel()
        discountedCostContent.font = .systemFont(ofSize: 14)
        discountedCostContent.textColor = .systemGray2
        return discountedCostContent
    }()
    
}

//MARK: - Configure Of Layout
extension FoodInformation {
    private func configureFoodInformationStackView() {
        axis = .vertical
        spacing = 8
        alignment = .leading
        distribution = .equalSpacing
    }
    
    private func configureOfLayout() {
        foodInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodInformationStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            foodInformationStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            foodInformationStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            foodInformationStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            foodInformationStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 72)
        ])
    }
    
    private func configurationComponents() {
        configureFoodInformationStackView()
        addArrangedSubview(foodInformationStackView)
        configureOfLayout()
        
        foodInformationStackView.addArrangedSubview(foodTitle)
        foodInformationStackView.addArrangedSubview(foodDescription)
        foodInformationStackView.addArrangedSubview(foodPriceStackView)
        
        foodPriceStackView.addArrangedSubview(primeCostContent)
        foodPriceStackView.addArrangedSubview(discountedCostContent)
//        addArrangedSubview(badgeStackView)
    }
}

//MARK: - Define UI Components
extension FoodInformation {
    func setTitle(by text: String) {
        foodTitle.text = text
    }
    
    func setDescription(by text: String) {
        foodDescription.text = text
    }
    
    func setPrimeCost(by text: String) {
        primeCostContent.text = text
    }
    
    func setDiscountedCost(by text: String) {
        discountedCostContent.text = text
        convertTextStyleToStrikethrough(from: discountedCostContent)
    }
    
    func setCostChoose(between primeCost: String?, or discountedCost: String?) {
        
        guard let discountedCost = discountedCost else { return }
        guard let primeCost = primeCost else { return }
        
        if !primeCost.isEmpty && !discountedCost.isEmpty {
            setPrimeCost(by: primeCost)
            setDiscountedCost(by: discountedCost)
            foodPriceStackView.addArrangedSubview(primeCostContent)
            foodPriceStackView.addArrangedSubview(discountedCostContent)
        } else {
            setPrimeCost(by: discountedCost)
            foodPriceStackView.addArrangedSubview(primeCostContent)
        }
    }
    
    private func convertTextStyleToStrikethrough(from label: UILabel) {
        guard let text = label.text else { return }
        
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                     value: NSUnderlineStyle.single.rawValue,
                                     range: NSRange(location: 0, length: attributeString.length))
        label.textColor = .systemGray2
        label.attributedText = attributeString
    }
    
    private func setBadge(by bargainPriceTypes: [String]?) {
        guard let bargainPriceTypes = bargainPriceTypes else { return }
        
        bargainPriceTypes.forEach { priceType in
            switch BargainPriceTypeList(rawValue: priceType) {
            case .best:
                let badge = UILabel.makeBadge(title: priceType, backgroundColor: UIColor.launchingBadgeBackground)
                badgeStackView.addArrangedSubview(badge)
            case .new:
                let badge = UILabel.makeBadge(title: priceType, backgroundColor: UIColor.eventBadgeBackground)
                badgeStackView.addArrangedSubview(badge)
            case .season:
                let badge = UILabel.makeBadge(title: priceType, backgroundColor: UIColor.defaultBadgeBackground)
                badgeStackView.addArrangedSubview(badge)
            case .none:
                return
            }
        }
    }
}

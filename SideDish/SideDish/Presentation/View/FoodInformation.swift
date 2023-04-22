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
    
    private var foodPriceStackView: UIStackView = {
        let foodPriceStackView = UIStackView()
        foodPriceStackView.axis = .horizontal
        foodPriceStackView.spacing = 4
        foodPriceStackView.distribution = .equalSpacing
        return foodPriceStackView
    }()
    
    private var badgeStackView: UIStackView = {
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
        foodInformationStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 72).isActive = true
    }
    
    private func configurationComponents() {
        configureFoodInformationStackView()
        addArrangedSubview(foodInformationStackView)
        foodInformationStackView.addArrangedSubview(foodTitle)
        foodInformationStackView.addArrangedSubview(foodDescription)
        foodInformationStackView.addArrangedSubview(foodPriceStackView)
        addArrangedSubview(badgeStackView)
        configureOfLayout()
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
    }
    
    func setCostChoose(between primeCost: String?, or discountedCost: String?) {
        guard let discountedCost = discountedCost else { return }
        
        if let primeCost = primeCost {
            setPrimeCost(by: primeCost)
            setDiscountedCost(by: discountedCost)
            convertTextStyleToStrikethrough(from: discountedCostContent)
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
}

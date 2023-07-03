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
        backgroundColor = .white
        
        configureOfScroll()
        addSubViewInProductInformation()
        configureOfLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureOfScroll()
        addSubViewInProductInformation()
        configureOfLayout()
    }
    
    /// Custom SubClass View
    
    private let contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private let foodThumbScroll = FoodThumbImages()
    private let detailFoodInfo = DetailFoodInformation()
    private let deliveryInformation = DeliveryInformation()
    private let orderCount = OrderCount()
    private let orderAmount = OrderAmount()
    
    private let cookingImages = CookingImages()
    
    private let divisionLine: UIView = {
        let divisionLine = UIView()
        divisionLine.backgroundColor = .systemGray4
        return divisionLine
    }()
    
    private let divisionLine2: UIView = {
        let divisionLine2 = UIView()
        divisionLine2.backgroundColor = .systemGray4
        return divisionLine2
    }()
    
    private let divisionLine3: UIView = {
        let divisionLine3 = UIView()
        divisionLine3.backgroundColor = .systemGray4
        return divisionLine3
    }()
    
    /// [Public] Method
    func convey(by datas: [String]) {
        foodThumbScroll.imagePaths = datas
    }
    
    func setFood(title: String, description: String) {
        detailFoodInfo.setFoodTitle(by: title)
        detailFoodInfo.setFoodDescription(by: description)
    }
    
    func setFood(price: String, salePrice: String) {
        detailFoodInfo.setPrimePrice(by: price)
        detailFoodInfo.setSalePrice(by: salePrice)
    }
    
    func setFood(by badge: [String]) {
        detailFoodInfo.setMockBadge(by: badge[0])
    }
    
    func setDeliveryInfo(by data: [String]) {
        deliveryInformation.configureOfUIComponents(info: data)
    }
    
    func setOrder(by price: String) {
        orderAmount.setOrderAmount(by: price)
    }
    
    func setCookingImage(by data: [String]) {
        cookingImages.addCooking(by: data)
    }
    
    /// [Private] Method
    private func configureOfScroll() {
        self.isScrollEnabled = true
        self.showsVerticalScrollIndicator = false
    }
}

//MARK: - Configure of Layout

extension ProductInformation {
    
    private func createSeparateLine(by stackView: UIStackView, view: UIView) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            view.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func arrangeOfLayout(by stackView: UIStackView, with separateLine: UIView) {
        //TODO: - Layout 중복되는 보일러플레이트 코드 줄이기
    }
    
    private func addSubViewInProductInformation() {
        self.addSubview(contentView)
        contentView.addSubview(foodThumbScroll)
        
        [detailFoodInfo, deliveryInformation,
         orderCount, orderAmount, cookingImages].forEach { customStackView in
            customStackView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(customStackView)
        }
        
        [divisionLine, divisionLine2, divisionLine3].forEach { customView in
            customView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(customView)
        }
    }
    
    private func configureOfLayout() {
        
        let contentArea = self.contentLayoutGuide
        let frameArea = self.frameLayoutGuide
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: contentArea.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentArea.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: frameArea.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 2795)
        ])
        
        foodThumbScroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodThumbScroll.topAnchor.constraint(equalTo: contentArea.topAnchor),
            foodThumbScroll.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            foodThumbScroll.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),
            foodThumbScroll.widthAnchor.constraint(equalTo: contentArea.widthAnchor),
            foodThumbScroll.heightAnchor.constraint(equalToConstant: 376),
        ])
        
        NSLayoutConstraint.activate([
            detailFoodInfo.topAnchor.constraint(equalTo: foodThumbScroll.bottomAnchor),
            detailFoodInfo.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor, constant: 16),
            detailFoodInfo.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor, constant: -16),
            detailFoodInfo.heightAnchor.constraint(equalToConstant: 152)
        ])
        
        createSeparateLine(by: detailFoodInfo, view: divisionLine)
        
        NSLayoutConstraint.activate([
            deliveryInformation.topAnchor.constraint(equalTo: divisionLine.bottomAnchor, constant: 24),
            deliveryInformation.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            deliveryInformation.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            deliveryInformation.heightAnchor.constraint(equalToConstant: 104)
        ])
        
        createSeparateLine(by: deliveryInformation, view: divisionLine2)
        
        NSLayoutConstraint.activate([
            orderCount.topAnchor.constraint(equalTo: divisionLine2.bottomAnchor, constant: 24),
            orderCount.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            orderCount.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            orderCount.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        createSeparateLine(by: orderCount, view: divisionLine3)
        
        NSLayoutConstraint.activate([
            orderAmount.topAnchor.constraint(equalTo: divisionLine3.bottomAnchor, constant: 24),
            orderAmount.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            orderAmount.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            orderAmount.heightAnchor.constraint(equalToConstant: 122)
        ])
        
        NSLayoutConstraint.activate([
            cookingImages.topAnchor.constraint(equalTo: orderAmount.bottomAnchor, constant: 48),
            cookingImages.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            cookingImages.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            cookingImages.heightAnchor.constraint(equalToConstant: 1818)
        ])
    }
}

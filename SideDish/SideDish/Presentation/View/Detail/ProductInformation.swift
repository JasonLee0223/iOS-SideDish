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
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureOfScroll()
        addSubViewInProductInformation()
        configureOfLayout()
        setUp()
    }
    
    /// Custom SubClass View
    
    private let contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private let foodThumbScroll = FoodThumbImages()
    private let detailFoodInfo = DetailFoodInfo()
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
    
    /// [Private] Method
    private func configureOfScroll() {
        self.isScrollEnabled = true
        self.showsVerticalScrollIndicator = false
    }
    
    private func setUp() {
        let foodInfo = ["오리 주물럭_반조리", "감칠맛 나는 매콤한 양념", "12,640", "15,800", "런칭특가"]
        let deliveryInfo = ["126원", "서울 경기 새벽 배송, 전국 택배 배송", "2,500원 (40,000원 이상 구매 시 무료)"]
        detailFoodInfo.configureOfFoodInfoUIComponents(foodInfo: foodInfo)
        deliveryInformation.configureOfUIComponents(info: deliveryInfo)
        orderAmount.setOrderAmount(by: "12,640원")
        cookingImages.addCooking(by: cookingImages.mockImageName)
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
    
    private func addSubViewInProductInformation() {
        self.addSubview(contentView)
        contentView.addSubview(foodThumbScroll)
        
        [detailFoodInfo, deliveryInformation,
         orderCount, orderAmount, cookingImages].forEach { customStackView in
            contentView.addSubview(customStackView)
        }
        
        [divisionLine, divisionLine2, divisionLine3].forEach { customView in
            contentView.addSubview(customView)
        }
    }
    
    private func configureOfLayout() {
        
        let safeArea = self.safeAreaLayoutGuide
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
        
        detailFoodInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailFoodInfo.topAnchor.constraint(equalTo: foodThumbScroll.bottomAnchor),
            detailFoodInfo.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            detailFoodInfo.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            detailFoodInfo.heightAnchor.constraint(equalToConstant: 152)
        ])
        
        divisionLine.translatesAutoresizingMaskIntoConstraints = false
        createSeparateLine(by: detailFoodInfo, view: divisionLine)
        
        deliveryInformation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deliveryInformation.topAnchor.constraint(equalTo: divisionLine.bottomAnchor, constant: 24),
            deliveryInformation.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            deliveryInformation.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            deliveryInformation.heightAnchor.constraint(equalToConstant: 104)
        ])
        
        divisionLine2.translatesAutoresizingMaskIntoConstraints = false
        createSeparateLine(by: deliveryInformation, view: divisionLine2)
        
        orderCount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderCount.topAnchor.constraint(equalTo: divisionLine2.bottomAnchor, constant: 24),
            orderCount.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            orderCount.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            orderCount.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        divisionLine3.translatesAutoresizingMaskIntoConstraints = false
        createSeparateLine(by: orderCount, view: divisionLine3)
        
        orderAmount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderAmount.topAnchor.constraint(equalTo: divisionLine3.bottomAnchor, constant: 24),
            orderAmount.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            orderAmount.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            orderAmount.heightAnchor.constraint(equalToConstant: 122)
        ])
        
        cookingImages.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cookingImages.topAnchor.constraint(equalTo: orderAmount.bottomAnchor, constant: 48),
            cookingImages.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            cookingImages.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            cookingImages.heightAnchor.constraint(equalToConstant: 1818)
        ])
    }
}


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
        configureOfLayout()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureOfScroll()
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
    }
}

//MARK: - Configure of Layout

extension ProductInformation {
    
    private func configureOfLayout() {
        
        let safeArea = self.safeAreaLayoutGuide
        let contentArea = self.contentLayoutGuide
        let frameArea = self.frameLayoutGuide
        
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: contentArea.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentArea.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: frameArea.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 977)
        ])
        
        contentView.addSubview(foodThumbScroll)
        foodThumbScroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodThumbScroll.topAnchor.constraint(equalTo: contentArea.topAnchor),
            foodThumbScroll.leadingAnchor.constraint(equalTo: contentArea.leadingAnchor),
            foodThumbScroll.trailingAnchor.constraint(equalTo: contentArea.trailingAnchor),
            foodThumbScroll.widthAnchor.constraint(equalTo: contentArea.widthAnchor),
            foodThumbScroll.heightAnchor.constraint(equalToConstant: 376),
        ])
        
        contentView.addSubview(detailFoodInfo)
        detailFoodInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailFoodInfo.topAnchor.constraint(equalTo: foodThumbScroll.bottomAnchor),
            detailFoodInfo.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            detailFoodInfo.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            detailFoodInfo.heightAnchor.constraint(equalToConstant: 152)
        ])
        
        contentView.addSubview(divisionLine)
        divisionLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            divisionLine.topAnchor.constraint(equalTo: detailFoodInfo.bottomAnchor, constant: 24),
            divisionLine.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            divisionLine.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            divisionLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        contentView.addSubview(deliveryInformation)
        deliveryInformation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deliveryInformation.topAnchor.constraint(equalTo: divisionLine.bottomAnchor, constant: 24),
            deliveryInformation.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            deliveryInformation.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            deliveryInformation.heightAnchor.constraint(equalToConstant: 104)
        ])
        
        contentView.addSubview(divisionLine2)
        divisionLine2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            divisionLine2.topAnchor.constraint(equalTo: deliveryInformation.bottomAnchor, constant: 24),
            divisionLine2.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            divisionLine2.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            divisionLine2.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        contentView.addSubview(orderCount)
        orderCount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderCount.topAnchor.constraint(equalTo: divisionLine2.bottomAnchor, constant: 24),
            orderCount.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            orderCount.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            orderCount.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        contentView.addSubview(divisionLine3)
        divisionLine3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            divisionLine3.topAnchor.constraint(equalTo: orderCount.bottomAnchor, constant: 24),
            divisionLine3.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            divisionLine3.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            divisionLine3.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        contentView.addSubview(orderAmount)
        orderAmount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderAmount.topAnchor.constraint(equalTo: divisionLine3.bottomAnchor, constant: 24),
            orderAmount.leadingAnchor.constraint(equalTo: detailFoodInfo.leadingAnchor),
            orderAmount.trailingAnchor.constraint(equalTo: detailFoodInfo.trailingAnchor),
            orderAmount.heightAnchor.constraint(equalToConstant: 122)
        ])
    }
}

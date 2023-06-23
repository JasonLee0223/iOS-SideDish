//
//  OrderAmount.swift
//  SideDish
//
//  Created by Jason on 2023/06/23.
//

import UIKit

class OrderAmount: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureOfOrderAmount()
        configureOfLayout()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureOfOrderAmount()
        configureOfLayout()
    }
    
    private var amountGroup: UIStackView = {
        let amountGroup = UIStackView()
        amountGroup.axis = .horizontal
        amountGroup.spacing = 24
        amountGroup.alignment = .center
        amountGroup.distribution = .fill
        return amountGroup
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.text = "총 주문금액"
        title.font = .boldSystemFont(ofSize: 18)
        title.textColor = .systemGray2
        return title
    }()
    
    private let totalOrderAmount: UILabel = {
        let totalOrderAmount = UILabel()
        totalOrderAmount.font = .boldSystemFont(ofSize: 32)
        totalOrderAmount.textColor = .black
        return totalOrderAmount
    }()
    
    private let order: UIButton = {
        let order = UIButton()
        order.layer.cornerRadius = 10
        order.layer.borderWidth = 0.5
        
        order.setTitle("주문하기", for: .normal)
        order.titleLabel?.font = .boldSystemFont(ofSize: 18)
        order.tintColor = .white
        order.backgroundColor = .blue
        return order
    }()
}

//MARK: - Configure of UI Components
extension OrderAmount {
    
    func setOrderAmount(by value: String) {
        totalOrderAmount.text = value
    }
    
    private func configureOfOrderAmount() {
        self.axis = .vertical
        self.spacing = 24
        self.alignment = .trailing
        self.distribution = .fill
    }
}

//MARK: - [Private] Configure of Layout
extension OrderAmount {
    
    private func configureOfLayout() {
        self.addArrangedSubview(amountGroup)
        amountGroup.addArrangedSubview(title)
        amountGroup.addArrangedSubview(totalOrderAmount)
        self.addArrangedSubview(order)
        
        order.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            order.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor)
        ])
    }
}

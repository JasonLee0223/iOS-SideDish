//
//  OrderCount.swift
//  SideDish
//
//  Created by Jason on 2023/06/23.
//

import UIKit

protocol OrderProtocol: AnyObject {
    
    var orderCount: Int { get set }
}

class OrderCount: UIStackView {
    
    weak var countDelegate: OrderProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setOrderCount()
        configureOfLayout()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setOrderCount()
        configureOfLayout()
    }
    
    private let title: UILabel = {
        let title = UILabel()
        title.text = "수량"
        title.font = .systemFont(ofSize: 14)
        title.textColor = .black
        return title
    }()
    
    private let quantityGroup: UIStackView = {
        let quantityGroup = UIStackView()
        quantityGroup.axis = .horizontal
        quantityGroup.distribution = .fill
        quantityGroup.alignment = .fill
        quantityGroup.spacing = 24
        return quantityGroup
    }()
    
    private let quantity: UILabel = {
        let quantity = UILabel()
        quantity.text = "0"
        quantity.font = .boldSystemFont(ofSize: 18)
        quantity.textColor = .black
        return quantity
    }()
    
    private lazy var quantityStepper: UIStepper = {
        let quantityStepper = UIStepper()
        quantityStepper.autorepeat = false
        quantityStepper.value = 1
        quantityStepper.isContinuous = true
        quantityStepper.addTarget(self, action: #selector(calculateQuantity), for: .touchUpInside)
        return quantityStepper
    }()
    
    @objc private func calculateQuantity(_ sender: UIStepper) {
        let newOrder = Int(sender.value)
        quantity.text = newOrder.description
        countDelegate?.orderCount = newOrder
    }
}

//MARK: - [Private] Configure of StackView
extension OrderCount {
    
    private func setOrderCount() {
        self.axis = .horizontal
        self.distribution = .fill
        self.alignment = .fill
        self.spacing = 150
    }
}

//MARK: - [Private] Configure of Layout
extension OrderCount {
    
    private func configureOfLayout() {
        self.addArrangedSubview(title)
        self.addArrangedSubview(quantityGroup)
        quantityGroup.addArrangedSubview(quantity)
        quantityGroup.addArrangedSubview(quantityStepper)
    }
}

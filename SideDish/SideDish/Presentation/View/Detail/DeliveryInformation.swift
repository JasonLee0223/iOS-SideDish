//
//  DeliveryInformation.swift
//  SideDish
//
//  Created by Jason on 2023/06/23.
//

import UIKit

//MARK: - DeliveryInformation StackView
class DeliveryInformation: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureOfSuperStackView()
        configureOfLayout()
        configureOfUIComponentsAttributes()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureOfSuperStackView()
        configureOfLayout()
        configureOfUIComponentsAttributes()
    }
    
    /// StackView Property
    
    private let pointGroup = UIStackView()
    
    private let deliveryGroup = UIStackView()
    
    private let feeGroup = UIStackView()
    
    /// Label Property
    
    private let point = UILabel()
    
    private let pointBody = UILabel()
    
    private let delivery = UILabel()
    
    private let deliveryBody = UILabel()
    
    private let fee = UILabel()
    
    private let feeBody = UILabel()
}

//MARK: - Configure of UI Compoenets
extension DeliveryInformation {
    
    func configureOfUIComponents(info: [String]) {
        setOrderPoint(by: info[0])
        setDeliveryType(by: info[1])
        setFee(by: info[2])
    }
    
    /// Sub Method
    
    private func setOrderPoint(by text: String) {
        point.text = "적립금"
        pointBody.text = text
    }
    
    private func setDeliveryType(by text: String) {
        delivery.text = "배송정보"
        deliveryBody.text = text
    }
    
    private func setFee(by text: String) {
        fee.text = "배송비"
        feeBody.text = text
    }
    
    private func configureOfUIComponentsAttributes() {
        let stackViewBox = [pointGroup, deliveryGroup, feeGroup]
        
        let labelBox = [point, pointBody, delivery, deliveryBody, fee, feeBody]
        
        stackViewBox.forEach { stackView in
            commonStackViewAttribute(of: stackView)
        }
        
        labelBox.forEach { label in
            commonLabelAttribute(of: label)
        }
    }
    
    private func configureOfSuperStackView() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        distribution = .equalSpacing
        spacing = 16
    }
    
    private func commonStackViewAttribute(of stackView: UIStackView) {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
    }
    
    private func commonLabelAttribute(of label: UILabel) {
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.textAlignment = .left
    }
}

//MARK: - Configure of Layout
extension DeliveryInformation {
    
    private func configureOfLayout() {
        self.addArrangedSubview(pointGroup)
        self.addArrangedSubview(deliveryGroup)
        self.addArrangedSubview(feeGroup)
        
        [point, pointBody].forEach { label in
            pointGroup.addArrangedSubview(label)
        }
        point.setContentHuggingPriority(.init(252), for: .horizontal)
        pointBody.setContentHuggingPriority(.init(251), for: .horizontal)
        
        [delivery, deliveryBody].forEach { label in
            deliveryGroup.addArrangedSubview(label)
        }

        [fee, feeBody].forEach { label in
            feeGroup.addArrangedSubview(label)
        }
    }
}

//
//  HomeHeaderView.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit

final class HomeHeaderView: UICollectionReusableView {
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    //MARK: - Private Property
    
    private let titleFontSize: CGFloat = 32.0
    
    private lazy var sectionStackView: UIStackView = {
        let sectionStackView = UIStackView()
        sectionStackView.axis = .vertical
        sectionStackView.distribution = .fillProportionally
        return sectionStackView
    }()
    
    private lazy var sectionTitle: UILabel = {
        let sectionTitle = UILabel()
        sectionTitle.font = .systemFont(ofSize: titleFontSize, weight: .medium)
        sectionTitle.numberOfLines = 2
        return sectionTitle
    }()
    
}

//MARK: - Configure of Layout
extension HomeHeaderView {
    private func configuration() {
        addSubview(sectionStackView)
        [sectionTitle].forEach { label in
            sectionStackView.addArrangedSubview(label)
        }
        ConfigureOfStackViewLayout()
    }
    
    private func ConfigureOfStackViewLayout() {
        let sectionInset: CGFloat = 16.0
        sectionStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionStackView.topAnchor.constraint(equalTo: topAnchor, constant: sectionInset),
            sectionStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -sectionInset),
            sectionStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sectionInset),
            sectionStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sectionInset)
        ])
    }
}

//MARK: - Define UI Component
extension HomeHeaderView {
    func setTitle(headerText: String?) {
        sectionTitle.text = headerText
    }
}

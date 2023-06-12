//
//  HomeHeaderView.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit

final class HomeHeaderView: UICollectionReusableView, Reusable {
    
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
        let sectionInset: CGFloat = 16.0
        addSubview(sectionTitle)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionTitle.topAnchor.constraint(equalTo: topAnchor, constant: sectionInset),
            sectionTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -sectionInset),
            sectionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sectionInset),
            sectionTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sectionInset)
        ])
    }
}

//MARK: - Define UI Component
extension HomeHeaderView {
    func setTitle(headerText: String?) {
        sectionTitle.text = headerText
    }
}

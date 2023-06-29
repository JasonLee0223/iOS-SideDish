//
//  HomeHeaderView.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit
protocol HeaderDelegate: AnyObject {
    
    func didTapSectionHeader(section: HomeHeaderView, sectionNumber: Int)
}

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
        let sideInset: CGFloat = 16.0
        let upDownInset: CGFloat = 24.0
        
        addSubview(sectionTitle)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionTitle.topAnchor.constraint(equalTo: topAnchor, constant: upDownInset),
            sectionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sideInset),
            sectionTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sideInset),
            sectionTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -upDownInset),
        ])
    }
}

//MARK: - Define UI Component
extension HomeHeaderView {
    func setTitle(headerText: String?) {
        sectionTitle.text = headerText
    }
}

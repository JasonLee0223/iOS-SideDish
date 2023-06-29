//
//  HomeHeaderView.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit
import Toast

protocol HeaderDelegate: AnyObject {
    
    func didTapSectionHeader(section: HomeHeaderView, sectionNumber: Int)
}

final class HomeHeaderView: UICollectionReusableView, Reusable {
    
    var itemsCount = 0
    weak var headerDelegate: HeaderDelegate?
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        setTapGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configuration()
        setTapGesture()
    }
    
    //MARK: - Private Property
    
    private var sectionNumber: Int?
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
    
    func findSectionNumber(by number: Int) {
        sectionNumber = number
    }
    
    internal func setTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedHeaderView))
        addGestureRecognizer(gesture)
    }
    
    @objc private func tappedHeaderView() {
        if let sectionNumber = sectionNumber {
            headerDelegate?.didTapSectionHeader(section: self, sectionNumber: sectionNumber)
            
            let toastPoint = CGPoint(x: self.frame.size.width / 3, y: self.frame.size.height)
    
            var toastStyle = ToastStyle()
            toastStyle.backgroundColor = .white
            toastStyle.activitySize = self.frame.size
            toastStyle.messageColor = .gray
    
            self.makeToast("\(itemsCount)개 상품이 등록되어 있습니다.", point: toastPoint,
                           title: nil, image: nil, style: toastStyle, completion: nil)
        }
    }
}

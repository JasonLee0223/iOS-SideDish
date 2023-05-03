//
//  HomeViewlCell.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit

final class HomeViewCell: UICollectionViewCell {
    
    //MARK: - Private Property
    
    static let identifier = String(describing: HomeViewCell.self)
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    //MARK: - Private Property
    private lazy var cellView = UIView()
    
    private lazy var foodInformationStackView = FoodInformation()
    
    private lazy var foodImageView: UIImageView = {
        let foodImageView = UIImageView()
        foodImageView.contentMode = .scaleToFill
        foodImageView.frame.size = CGSize(width: 130, height: 130)
        foodImageView.layer.cornerRadius = 5
        foodImageView.clipsToBounds = true
        return foodImageView
    }()
    
    private func configuration() {
        contentView.addSubview(cellView)
        cellView.addSubview(foodImageView)
        cellView.addSubview(foodInformationStackView)
        
        configureOfCellLayout()
        configureStackViewLayout()
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        prepareForReuse(stackView: foodInformationStackView.foodPriceStackView)
        prepareForReuse(stackView: foodInformationStackView.badgeStackView)
    }
    
    private func prepareForReuse(stackView: UIStackView) {
        stackView.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}

//MARK: - Configure of Layout
extension HomeViewCell {
    private func configureOfCellLayout() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func configureStackViewLayout() {
        foodInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodInformationStackView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            foodInformationStackView.leadingAnchor.constraint(equalTo: foodImageView.leadingAnchor, constant: 8),
            foodInformationStackView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor)
        ])
    }
}

//MARK: - Define UI Component
extension HomeViewCell {
    func setFoodImage(image: UIImage) {
        self.foodImageView.image = image
    }
}

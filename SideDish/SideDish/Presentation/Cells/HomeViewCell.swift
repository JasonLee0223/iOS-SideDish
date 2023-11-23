//
//  HomeViewlCell.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit

final class HomeViewCell: UICollectionViewCell, Reusable {
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configuration()
    }
    
    //MARK: - Private Property
    private lazy var cellView = UIView()
    
    private(set) lazy var foodInformationStackView = FoodInformation()
    
    private lazy var foodImageView: UIImageView = {
        let foodImageView = UIImageView()
        foodImageView.contentMode = .scaleToFill
        foodImageView.frame.size = CGSize(width: self.frame.height, height: self.frame.height)
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
        
    private func prepareForReuse(stackView: UIStackView) {
        stackView.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        foodImageView.image = nil
        prepareForReuse(stackView: foodInformationStackView.foodPriceStackView)
        prepareForReuse(stackView: foodInformationStackView.badgeStackView)
    }
}

//MARK: - Configure of Layout
extension HomeViewCell {
    private func configureOfCellLayout() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            cellView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func configureStackViewLayout() {
        foodInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodInformationStackView.centerYAnchor.constraint(equalTo: cellView.safeAreaLayoutGuide.centerYAnchor),
            foodInformationStackView.leadingAnchor.constraint(equalTo: foodImageView.safeAreaLayoutGuide.trailingAnchor, constant: 8),
            foodInformationStackView.trailingAnchor.constraint(equalTo: cellView.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

//MARK: - Define UI Component
extension HomeViewCell {
    func configure(of food: Food) {
        
        guard let foodImage = UIImage(data: food.foodImage) else {
            return
        }
        
        setFoodImage(image: foodImage)
        
        foodInformationStackView.setTitle(
            by: food.foodInformation.foodName
        )
        
        foodInformationStackView.setDescription(
            by: food.foodInformation.foodDescription
        )
        
        foodInformationStackView.setCostChoose(
            between: food.cost.primeCost, or: food.cost.saleCost
        )
        
        foodInformationStackView.setBadge(by: food.badge)
    }
    
    private func setFoodImage(image: UIImage) {
        self.foodImageView.image = image
    }
}

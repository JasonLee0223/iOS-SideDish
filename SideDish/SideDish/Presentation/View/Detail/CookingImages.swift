//
//  CookingImages.swift
//  SideDish
//
//  Created by Jason on 2023/06/23.
//

import UIKit

class CookingImages: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureOfCookingImages()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureOfCookingImages()
    }
}

extension CookingImages {
    
    func addCooking(by images: [String]) {
        
        images.forEach { imagePath in
            
            guard let imageURL = URL(string: imagePath) else {
                return
            }
            
            guard let imageData = try? Data(contentsOf: imageURL) else {
                return
            }
            
            guard let image = UIImage(data: imageData) else {
                 return
            }
            
            let cookingImage = UIImageView()
            cookingImage.image = image
            cookingImage.contentMode = .scaleAspectFit
            cookingImage.frame = CGRect(
                origin: self.frame.origin, size: self.frame.size
            )
            
            self.addArrangedSubview(cookingImage)
        }
    }
    
    private func configureOfCookingImages() {
        axis = .vertical
        alignment = .fill
        distribution = .fillProportionally
    }
}


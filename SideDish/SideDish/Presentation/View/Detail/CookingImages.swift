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
    
    let mockImageName = [ "folder.fill", "person.fill", "star.fill"]
}

extension CookingImages {
    
    func addCooking(by images: [String]) {
        //TODO: - images 데이터로 변경
        
        mockImageName.forEach { imageName in
            
            let cookingImage = UIImageView()
            cookingImage.image = UIImage(systemName: imageName)
            cookingImage.contentMode = .scaleToFill
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


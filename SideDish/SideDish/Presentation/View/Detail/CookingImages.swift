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
            
            URLSession.shared.dataTask(with: imageURL) { data, _, _ in
                guard let imageData = data else { return }
                
                guard let image = UIImage(data: imageData) else {
                     return
                }
                
                Task(priority: .userInitiated) {
                    let cookingImage = UIImageView()
                    cookingImage.image = image
                    cookingImage.contentMode = .scaleAspectFit
                    cookingImage.frame = CGRect(
                        origin: self.frame.origin, size: self.frame.size
                    )
                    
                    self.addArrangedSubview(cookingImage)
                }
            }.resume()
        }
    }
    
    private func configureOfCookingImages() {
        axis = .vertical
        alignment = .fill
        distribution = .fillProportionally
    }
}


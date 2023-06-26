//
//  FoodThumbImages.swift
//  SideDish
//
//  Created by Jason on 2023/06/22.
//

import UIKit

class FoodThumbImages: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureOfLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureOfLayout()
    }
    
    var imagePaths = [String]() {
        didSet {
            setUp()
            addContentScrollView()
        }
    }
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .white // 페이지를 암시하는 동그란 점의 색상
        pageControl.currentPageIndicatorTintColor = .systemBlue // 현재 페이지를 암시하는 동그란 점 색상
        return pageControl
    }()
}

//MARK: - Configure of Scrollview Layout
extension FoodThumbImages {
    
    private func configureOfLayout() {
        self.addSubview(pageControl)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
    }
}

//MARK: - Configure of UI Components
extension FoodThumbImages {
    
    private func setUp() {
        configureOfScrollView()
        pageControl.numberOfPages = self.imagePaths.count
    }
    
    private func addContentScrollView() {
        for (index, imageName) in imagePaths.enumerated() {
            
            guard let imageURL = URL(string: imageName) else {
                print(ErrorOfHomeViewModel.FailOfMakeURL)
                return
            }
            
            guard let foodImageData = try? Data(contentsOf: imageURL) else {
                print(ErrorOfHomeViewModel.EmptyOfImageData)
                return
            }
            
            guard let foodImage = UIImage(data: foodImageData) else {
                print(ErrorOfHomeViewModel.EmptyOfImageData)
                return
            }
            
            let thumbImage = UIImageView()
            thumbImage.image = foodImage
            thumbImage.contentMode = .scaleToFill
            thumbImage.frame = CGRect(
                origin: self.frame.origin,
                size: CGSize(width: self.frame.width, height: self.contentSize.height)
            )
            
            thumbImage.frame.origin.x = self.frame.width * CGFloat(index)
            self.addSubview(thumbImage)
        }
   }
    
    private func configureOfScrollView() {
        
        self.frame = UIScreen.main.bounds
        self.contentSize = CGSize(
            width: UIScreen.main.bounds.width * CGFloat(imagePaths.count),
            height: UIScreen.main.bounds.height
        )
        self.delegate = self // scroll범위에 따라 pageControl의 값을 바꾸어주기 위한 delegate
        self.alwaysBounceVertical = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.isScrollEnabled = true
        self.isPagingEnabled = true
        self.bounces = false // 경계지점에서 bounce될건지 체크 (첫 or 마지막 페이지에서 바운스 스크롤 효과 여부)
        self.contentSize = CGSize(
            width: self.frame.width * CGFloat(imagePaths.count), height: 375
        )
    }
}

extension FoodThumbImages: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}

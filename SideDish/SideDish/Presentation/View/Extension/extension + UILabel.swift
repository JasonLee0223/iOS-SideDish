//
//  extension+UILabel.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit

extension UILabel {
    static func makeBadge(title: String, backgroundColor: UIColor) -> UILabel {
        let label = CustomBadgeLabel(padding: UIEdgeInsets(top: 4, left: 16,
                                                           bottom: 4, right: 16))
        label.text = title
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.backgroundColor = backgroundColor
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 13
        label.layer.masksToBounds = true
        return label
    }
    
    final class CustomBadgeLabel: UILabel {
        private var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        convenience init(padding: UIEdgeInsets) {
            self.init()
            self.padding = padding
        }
        
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: padding))
        }
        
        override var intrinsicContentSize: CGSize {
            var contentSize = super.intrinsicContentSize
            contentSize.width += padding.left + padding.right
            contentSize.height += padding.top + padding.bottom
            return contentSize
        }
    }
}

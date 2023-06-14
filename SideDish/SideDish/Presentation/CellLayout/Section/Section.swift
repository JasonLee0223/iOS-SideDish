//
//  Section.swift
//  SideDish
//
//  Created by Jason on 2023/06/13.
//

import Foundation

enum Section: Int, CaseIterable {
    case main = 0
    case soup
    case side
    
    var headerTitle: String {
        switch self {
        case .main: return "모두가 좋아하는 \n든든한 메인 요리"
        case .soup: return "정선이 담긴 \n뜨끈뜨끈 국물 요리"
        case .side: return "식탁을 풍성하게 하는 \n정갈한 밑반찬"
        }
    }
    
    var offerMenuName: String {
        switch self {
        case .main: return APIMagicLiteral.main
        case .soup: return APIMagicLiteral.soup
        case .side: return APIMagicLiteral.side
        }
    }
}

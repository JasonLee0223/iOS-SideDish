//
//  HomeCollectionViewDataSource.swift
//  SideDish
//
//  Created by Jason on 2023/05/06.
//

import Foundation
enum Section: CaseIterable {
    case main
enum Section: Int, CaseIterable {
    case main = 0
    case soup
    case sideDish
    
    var headerTitle: String {
        switch self {
        case .main: return "모두가 좋아하는 든든한 메인 요리"
        case .soup: return "정선이 담긴 뜨끈뜨끈 국물 요리"
        case .sideDish: return "식탁을 풍성하게 하는 정갈한 밑반찬"
        }
    }
}
}

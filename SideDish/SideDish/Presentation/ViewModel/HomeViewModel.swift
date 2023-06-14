//
//  HomeViewModel.swift
//  SideDish
//
//  Created by Jason on 2023/06/14.
//

import Foundation

final class HomeViewModel {
    
    var sectionStorage: [Section: Observable<Food>]
    
    init() {
        networkService = NetworkService()
        
        sectionStorage = [.main: Observable<Food>(), .soup: Observable<Food>(), .side: Observable<Food>()]
    }
    
    private let networkService: NetworkService
}

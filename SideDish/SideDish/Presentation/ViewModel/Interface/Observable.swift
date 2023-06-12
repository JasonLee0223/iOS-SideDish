//
//  Observable.swift
//  SideDish
//
//  Created by Jason on 2023/06/13.
//

import Foundation

final class Observable<T> {
    
    typealias Listener = ([T]?) throws -> Void
    
    var listener: Listener?
    
    var value: [T]? {
        didSet {
            do {
                try listener?(value)
            } catch {
//                print(HomeViewModelInError.dataIsEmpty)
            }
        }
    }
    
    init(_ value: [T]? = nil) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
}

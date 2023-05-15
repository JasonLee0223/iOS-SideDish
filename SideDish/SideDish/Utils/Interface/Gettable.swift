//
//  Gettable.swift
//  SideDish
//
//  Created by Jason on 2023/05/15.
//

import Foundation

protocol Gettable {
    static var identifier: String { get }
}

extension Gettable {
    static var identifier: String {
        return String(describing: self)
    }
}

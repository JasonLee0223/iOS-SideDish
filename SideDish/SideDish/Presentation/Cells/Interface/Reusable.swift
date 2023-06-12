//
//  Reusable.swift
//  SideDish
//
//  Created by Jason on 2023/05/15.
//

import Foundation

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

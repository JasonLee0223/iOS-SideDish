//
//  Endpoint.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

protocol RequestAndRespondable: Requestable, Respondable {}

class Endpoint<R>: RequestAndRespondable {
    typealias Response = R
    
    var baseURL: String
    var path: String
    var subPath: String
    var method: HTTPMethod
    
    init(baseURL: String,
         path: String,
         subPath: String,
         method: HTTPMethod = .get) {
        self.baseURL = baseURL
        self.path = path
        self.subPath = subPath
        self.method = method
    }
}

enum HTTPMethod: String {
    case get = "GET"
}

//
//  Requestable.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

protocol Requestable {
    var baseURL: String { get }
    var path: String { get }
    var subPath: String { get }
    var method: HTTPMethod { get }
}

extension Requestable {
    
    func getURLRequest() throws -> URLRequest {
        let url = try url()
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
    func url() throws -> URL {
        
        var fullPath = ""
        
        if subPath.isEmpty {
            fullPath = "\(baseURL)\(path)"
        } else {
            fullPath = "\(baseURL)\(path)\(subPath)"
        }
        
        guard let urlComponents = URLComponents(string: fullPath) else {
            throw NetworkError.invalidComponents
        }
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidComponents
        }
        
        return url
    }
}

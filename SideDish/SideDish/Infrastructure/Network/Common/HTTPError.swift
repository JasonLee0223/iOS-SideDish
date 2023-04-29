//
//  HTTPError.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

enum HTTPError: Error {
    case redirectionMessages(_ statusCode: Int, _ description: String)
    case clientErrorResponses(_ statusCode: Int, _ description: String)
    case serverErrorResponses(_ statusCode: Int, _ description: String)
    case networkFailError(_ statusCode: Int)
}

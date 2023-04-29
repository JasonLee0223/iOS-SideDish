//
//  NetworkError.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

enum NetworkError: LocalizedError {
    case unknownError
    case invalidComponents
    case urlRequest
    case emptyData
    case decodeError

    var errorDescription: String? {
        switch self {
        case .unknownError: return "알 수 없는 에러"
        case .invalidComponents: return "잘못된 URL Components 에러"
        case .urlRequest: return "URLRequest 관련 에러"
        case .emptyData: return "data가 비어있습니다."
        case .decodeError: return "decode 에러가 발생했습니다."
        }
    }
}

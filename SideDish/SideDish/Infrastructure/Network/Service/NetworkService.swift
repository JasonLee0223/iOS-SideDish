//
//  NetworkService.swift
//  SideDish
//
//  Created by Jason on 2023/04/29.
//

import Foundation

class NetworkService {
    
    let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func request<R: Decodable, E: RequestAndRespondable>(with endPoint: E) async throws -> R where E.Response == R {
        
        let urlRequest = try endPoint.getURLRequest()
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse else {
            throw NetworkError.urlRequest
        }
        
        try self.verify(with: httpResponse)
        
        return try self.decode(with: data)
    }
    
    private func verify(with HTTPResponse: HTTPURLResponse) throws {
        switch HTTPResponse.statusCode {
        case (300...399):
            throw HTTPError.redirectionMessages(HTTPResponse.statusCode, HTTPResponse.debugDescription)
        case (400...499):
            throw HTTPError.clientErrorResponses(HTTPResponse.statusCode, HTTPResponse.debugDescription)
        case (500...599):
            throw HTTPError.serverErrorResponses(HTTPResponse.statusCode, HTTPResponse.debugDescription)
        default:
            throw HTTPError.networkFailError(HTTPResponse.statusCode)
        }
    }
    
    private func decode<R: Decodable>(with apiData: Data) throws -> R {
        var decode: R
        let decoder = JSONDecoder()
        
        do {
            decode = try decoder.decode(R.self, from: apiData) as R
        } catch {
            throw NetworkError.decodeError
        }
        
        return decode
    }
}

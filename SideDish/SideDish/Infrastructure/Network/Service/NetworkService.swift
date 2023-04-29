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
        let (data, _) = try await session.data(for: urlRequest)
        let networkResult: R = try self.decode(with: data)
        
        return networkResult
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

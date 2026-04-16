//
//  NetworkServiceMock.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 14/04/2026.
//

import Foundation
@testable import RestCountries

final class NetworkServiceMock: NetworkService, @unchecked Sendable {
    var resultData: Any?
    var error: Error?

    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        if let error { throw error }
        guard let result = resultData as? T else {
            throw URLError(.cannotParseResponse)
        }
        return result
    }
}

//
//  NetworkService.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 14/04/2026.
//

import Foundation

// MARK: - NetworkService

protocol NetworkService: Sendable {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
}

// MARK: - NetworkServiceDefault

final class NetworkServiceDefault: NetworkService {
    nonisolated func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        let urlRequest = try endpoint.asURLRequest()
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}

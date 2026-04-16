//
//  Endpoint.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 14/04/2026.
//

import Foundation

enum CountriesAPI {
    static let baseURL = "https://restcountries.com/v3.1"
}

// MARK: - Endpoint

protocol Endpoint: Sendable {
    nonisolated var baseURL: String { get }
    nonisolated var path: String { get }
    nonisolated var queryItems: [URLQueryItem] { get }

    nonisolated func asURLRequest() throws -> URLRequest
}

// MARK: - Default Implementation

extension Endpoint {
    var queryItems: [URLQueryItem] { [] }

    nonisolated func asURLRequest() throws -> URLRequest {
        guard var components = URLComponents(string: baseURL) else {
            throw URLError(.badURL)
        }
        components.path += path
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        return URLRequest(url: url)
    }
}

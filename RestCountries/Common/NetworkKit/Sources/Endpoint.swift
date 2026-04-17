//
//  Endpoint.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 14/04/2026.
//

import Foundation

public enum CountriesAPI {
    public static let baseURL = "https://restcountries.com/v3.1"
}

// MARK: - Endpoint

public protocol Endpoint: Sendable {
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }

    func asURLRequest() throws -> URLRequest
}

// MARK: - Default Implementation

public extension Endpoint {
    var queryItems: [URLQueryItem] { [] }

    func asURLRequest() throws -> URLRequest {
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

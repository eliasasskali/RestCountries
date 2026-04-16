//
//  CountriesDataSourceDefault.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

final class CountriesDataSourceDefault: CountriesDataSource {

    // MARK: - Dependencies

    private let networkService: NetworkService
    private let endpoint: Endpoint

    // MARK: - Initializer

    nonisolated init(
        networkService: NetworkService = NetworkServiceDefault(),
        endpoint: Endpoint = CountriesEndpoint()
    ) {
        self.networkService = networkService
        self.endpoint = endpoint
    }

    // MARK: - CountriesDataSource

    func fetchCountries() async throws -> [CountryDTO] {
        try await networkService.request(endpoint: endpoint)
    }
}

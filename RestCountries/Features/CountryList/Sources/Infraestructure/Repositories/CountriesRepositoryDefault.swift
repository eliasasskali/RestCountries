//
//  CountriesRepositoryDefault.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

final class CountriesRepositoryDefault: CountriesRepository {

    // MARK: - Dependencies

    private let countriesDataSource: CountriesDataSource

    // MARK: - Initializer

    init(countriesDataSource: CountriesDataSource) {
        self.countriesDataSource = countriesDataSource
    }

    // MARK: - CountriesRepository

    func fetchCountries() async throws -> [Country] {
        let countryDTOs = try await countriesDataSource.fetchCountries()
        return countryDTOs.compactMap { $0.toDomain() }
    }
}

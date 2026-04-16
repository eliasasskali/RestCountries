//
//  CountriesDataSource.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

protocol CountriesDataSource: Sendable {
    func fetchCountries() async throws -> [CountryDTO]
}

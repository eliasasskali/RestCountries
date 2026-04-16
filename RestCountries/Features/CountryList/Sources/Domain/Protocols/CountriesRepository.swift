//
//  CountriesRepository.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

protocol CountriesRepository {
    func fetchCountries() async throws -> [Country]
}

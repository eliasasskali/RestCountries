//
//  CountryDTO+Country.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

extension CountryDTO {
    func toDomain() -> Country? {
        guard let cca2,
              let name = name?.common ?? name?.official,
              let flagUrlString = flags?.svg ?? flags?.png,
              let flagURL = URL(string: flagUrlString)
        else { return nil }
        return Country(
            name: name,
            flag: .init(
                url: flagURL,
                alt: flags?.alt
            ),
            cca2: cca2,
            region: region
        )
    }
}

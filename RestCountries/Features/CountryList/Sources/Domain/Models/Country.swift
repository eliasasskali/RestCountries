//
//  Country.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

struct Country: Equatable, Hashable, Sendable, Identifiable {
    let name: String
    let flag: CountryFlag
    let cca2: String
    let region: String?

    // MARK: - Identifiable
    
    var id: String {
        return cca2
    }
}

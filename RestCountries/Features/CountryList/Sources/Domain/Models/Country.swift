//
//  Country.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

struct Country: Equatable, Sendable {
    let name: String
    let flag: CountryFlag
    let cca2: String
    let region: String?
}

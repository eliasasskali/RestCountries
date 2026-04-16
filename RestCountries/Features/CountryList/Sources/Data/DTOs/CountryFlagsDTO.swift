//
//  CountryDTO.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

struct CountryFlagsDTO: Decodable, Sendable {
    let png: String?
    let svg: String?
    let alt: String?
}

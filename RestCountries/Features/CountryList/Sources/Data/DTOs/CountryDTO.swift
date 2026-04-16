//
//  CountryDTO.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

struct CountryDTO: Decodable, Sendable {
    let name: CountryNameDTO?
    let flags: CountryFlagsDTO?
    let cca2: String?
    let region: String?
}

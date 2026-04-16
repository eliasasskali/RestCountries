//
//  CountryNameDTO.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

struct CountryNameDTO: Decodable, Sendable {
    let common: String?
    let official: String?
}

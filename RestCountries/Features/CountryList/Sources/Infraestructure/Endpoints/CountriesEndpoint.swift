//
//  CountriesEndpoint.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Foundation

struct CountriesEndpoint: Endpoint {

    // MARK: - Fields

    enum Field: String, CaseIterable {
        case name
        case flags
        case cca2
        case region
    }

    // MARK: - Dependencies

    let fields: [Field]

    // MARK: - Endpoint

    let baseURL = CountriesAPI.baseURL
    let path = "/all"
    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "fields", value: fields.map(\.rawValue).joined(separator: ","))
        ]
    }

    // MARK: - Initializer

    nonisolated init(fields: [Field] = Field.allCases) {
        self.fields = fields
    }
}

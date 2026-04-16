//
//  JsonLoader.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 14/04/2026.
//

import Foundation

enum JSONLoader {
    static func load(_ fileName: String) throws -> Data {
        let bundle = Bundle(for: BundleToken.self)
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            throw NSError(
                domain: "JSONLoader",
                code: 1,
                userInfo: [NSLocalizedDescriptionKey: "File \(fileName).json not found"]
            )
        }
        return try Data(contentsOf: url)
    }
}

private final class BundleToken {}

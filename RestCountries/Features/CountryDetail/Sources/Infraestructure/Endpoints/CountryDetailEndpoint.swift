import Foundation
import NetworkKit

struct CountryDetailEndpoint: Endpoint {

    // MARK: - Fields

    enum Field: String, CaseIterable {
        case name
        case flags
        case cca2
        case region
        case capital
        case population
        case area
        case languages
        case currencies
        case borders
        case timezones
        case continents
    }

    // MARK: - Dependencies

    let code: String
    let fields: [Field]

    // MARK: - Endpoint

    let baseURL = CountriesAPI.baseURL
    var path: String { "/alpha/\(code)" }
    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "fields", value: fields.map(\.rawValue).joined(separator: ","))
        ]
    }

    // MARK: - Initializer

    nonisolated init(code: String, fields: [Field] = Field.allCases) {
        self.code = code
        self.fields = fields
    }
}

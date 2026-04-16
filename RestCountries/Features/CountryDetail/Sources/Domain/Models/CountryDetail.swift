import Foundation

struct CountryDetail: Equatable, Sendable, Identifiable {
    let name: String
    let officialName: String?
    let flag: CountryFlag
    let cca2: String
    let region: String?
    let capitals: [String]
    let population: Int?
    let area: Double?
    let languages: [String]
    let currencies: [Currency]
    let borders: [String]
    let timezones: [String]
    let continents: [String]

    // MARK: - Identifiable

    var id: String {
        return cca2
    }
}

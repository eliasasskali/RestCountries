import Foundation

struct CountryDetailDTO: Decodable, Sendable {
    let name: CountryDetailNameDTO?
    let flags: CountryDetailFlagsDTO?
    let cca2: String?
    let region: String?
    let capital: [String]?
    let population: Int?
    let area: Double?
    let languages: [String: String]?
    let currencies: [String: CountryDetailCurrencyDTO]?
    let borders: [String]?
    let timezones: [String]?
    let continents: [String]?
}

import Foundation

protocol CountryDetailDataSource: Sendable {
    func fetchCountryDetail(code: String) async throws -> CountryDetailDTO
}

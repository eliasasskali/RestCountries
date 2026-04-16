import Foundation

protocol CountryDetailRepository {
    func fetchCountryDetail(code: String) async throws -> CountryDetail
}

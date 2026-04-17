@testable import RestCountries

final class CountryDetailRepositoryMock: CountryDetailRepository, @unchecked Sendable {
    var result: CountryDetail = .mock
    var error: Error?

    func fetchCountryDetail(code: String) async throws -> CountryDetail {
        if let error { throw error }
        return result
    }
}

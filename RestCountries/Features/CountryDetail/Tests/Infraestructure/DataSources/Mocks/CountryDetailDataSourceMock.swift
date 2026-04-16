@testable import RestCountries

final class CountryDetailDataSourceMock: CountryDetailDataSource, @unchecked Sendable {
    var result: CountryDetailDTO = .mock
    var error: Error?

    func fetchCountryDetail(code: String) async throws -> CountryDetailDTO {
        if let error { throw error }
        return result
    }
}

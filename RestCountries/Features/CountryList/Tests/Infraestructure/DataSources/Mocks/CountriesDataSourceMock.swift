@testable import RestCountries

final class CountriesDataSourceMock: CountriesDataSource, @unchecked Sendable {
    var result: [CountryDTO] = []
    var error: Error?

    func fetchCountries() async throws -> [CountryDTO] {
        if let error { throw error }
        return result
    }
}

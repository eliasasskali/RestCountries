@testable import RestCountries

final class CountriesRepositoryMock: CountriesRepository {
    var result: [Country] = []
    var error: Error?

    func fetchCountries() async throws -> [Country] {
        if let error { throw error }
        return result
    }
}

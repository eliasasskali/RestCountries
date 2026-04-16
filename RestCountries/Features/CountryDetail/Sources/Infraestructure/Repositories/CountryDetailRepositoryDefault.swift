import Foundation

// MARK: - CountryDetailRepositoryError

enum CountryDetailRepositoryError: Error {
    case invalidData
}

// MARK: - CountryDetailRepositoryDefault

final class CountryDetailRepositoryDefault: CountryDetailRepository {

    // MARK: - Dependencies

    private let dataSource: CountryDetailDataSource

    // MARK: - Initializer

    init(dataSource: CountryDetailDataSource) {
        self.dataSource = dataSource
    }

    // MARK: - CountryDetailRepository

    func fetchCountryDetail(code: String) async throws -> CountryDetail {
        let dto = try await dataSource.fetchCountryDetail(code: code)
        guard let countryDetail = dto.toDomain() else {
            throw CountryDetailRepositoryError.invalidData
        }
        return countryDetail
    }
}

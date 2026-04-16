import Foundation

final class CountryDetailDataSourceDefault: CountryDetailDataSource {

    // MARK: - Dependencies

    private let networkService: NetworkService

    // MARK: - Initializer

    nonisolated init(networkService: NetworkService = NetworkServiceDefault()) {
        self.networkService = networkService
    }

    // MARK: - CountryDetailDataSource

    func fetchCountryDetail(code: String) async throws -> CountryDetailDTO {
        let endpoint = CountryDetailEndpoint(code: code)
        return try await networkService.request(endpoint: endpoint)
    }
}

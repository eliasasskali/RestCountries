import XCTest
@testable import RestCountries

final class CountriesDataSourceDefaultTests: XCTestCase {

    func testCountriesDataSourceDefault_whenFetchCountries_thenReturnsDecodedCountries() async throws {
        // Arrange
        let networkService = NetworkServiceMock()
        networkService.resultData = [CountryDTO.mock]
        let sut = CountriesDataSourceDefault(networkService: networkService)

        // Act
        let countries = try await sut.fetchCountries()

        // Assert
        XCTAssertEqual(countries.count, 1)
        XCTAssertEqual(countries.first?.cca2, "ES")
        XCTAssertEqual(countries.first?.name?.common, "Spain")
    }

    func testCountriesDataSourceDefault_whenNetworkFails_thenThrowsError() async {
        // Arrange
        let networkService = NetworkServiceMock()
        networkService.error = URLError(.notConnectedToInternet)
        let sut = CountriesDataSourceDefault(networkService: networkService)

        // Act & Assert
        do {
            _ = try await sut.fetchCountries()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual((error as? URLError)?.code, .notConnectedToInternet)
        }
    }
}

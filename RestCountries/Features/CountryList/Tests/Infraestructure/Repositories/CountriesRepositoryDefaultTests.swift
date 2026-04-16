import XCTest
@testable import RestCountries

final class CountriesRepositoryDefaultTests: XCTestCase {

    func testFetchCountries_whenDataSourceReturnsValidDTOs_thenReturnsMappedCountries() async throws {
        // Arrange
        let dataSource = CountriesDataSourceMock()
        dataSource.result = [.mock]
        let sut = CountriesRepositoryDefault(countriesDataSource: dataSource)

        // Act
        let countries = try await sut.fetchCountries()

        // Assert
        XCTAssertEqual(countries.count, 1)
        XCTAssertEqual(countries.first?.name, "Spain")
        XCTAssertEqual(countries.first?.cca2, "ES")
    }

    func testFetchCountries_whenDataSourceReturnsInvalidDTOs_thenFiltersThemOut() async throws {
        // Arrange
        let dataSource = CountriesDataSourceMock()
        dataSource.result = [
            .mock,
            .buildMock(cca2: nil),
            .buildMock(name: nil),
        ]
        let sut = CountriesRepositoryDefault(countriesDataSource: dataSource)

        // Act
        let countries = try await sut.fetchCountries()

        // Assert
        XCTAssertEqual(countries.count, 1)
    }

    func testFetchCountries_whenDataSourceFails_thenThrowsError() async {
        // Arrange
        let dataSource = CountriesDataSourceMock()
        dataSource.error = URLError(.notConnectedToInternet)
        let sut = CountriesRepositoryDefault(countriesDataSource: dataSource)

        // Act & Assert
        do {
            _ = try await sut.fetchCountries()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual((error as? URLError)?.code, .notConnectedToInternet)
        }
    }
}

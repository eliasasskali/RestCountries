import XCTest
@testable import RestCountries

final class CountryDetailDataSourceDefaultTests: XCTestCase {

    func testFetchCountryDetail_whenSuccess_thenReturnsDecodedDTO() async throws {
        // Arrange
        let networkService = NetworkServiceMock()
        networkService.resultData = CountryDetailDTO.mock
        let sut = CountryDetailDataSourceDefault(networkService: networkService)

        // Act
        let detail = try await sut.fetchCountryDetail(code: "CO")

        // Assert
        XCTAssertEqual(detail.cca2, "CO")
        XCTAssertEqual(detail.name?.common, "Colombia")
        XCTAssertEqual(detail.population, 53057212)
    }

    func testFetchCountryDetail_whenNetworkFails_thenThrowsError() async {
        // Arrange
        let networkService = NetworkServiceMock()
        networkService.error = URLError(.notConnectedToInternet)
        let sut = CountryDetailDataSourceDefault(networkService: networkService)

        // Act & Assert
        do {
            _ = try await sut.fetchCountryDetail(code: "CO")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual((error as? URLError)?.code, .notConnectedToInternet)
        }
    }
}

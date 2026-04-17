import XCTest
@testable import RestCountries

@MainActor
final class CountryDetailViewModelTests: XCTestCase {

    func testFetchCountryDetail_whenSuccess_thenCountryDetailIsPopulated() async {
        // Arrange
        let repository = CountryDetailRepositoryMock()
        repository.result = .mock
        let sut = CountryDetailViewModel(repository: repository, countryCode: "CO")

        // Act
        await sut.fetchCountryDetail()

        // Assert
        XCTAssertEqual(sut.countryDetail?.name, "Colombia")
        XCTAssertEqual(sut.countryDetail?.cca2, "CO")
        XCTAssertEqual(sut.countryDetail?.capitals, ["Bogotá"])
        XCTAssertFalse(sut.isLoading)
        XCTAssertNil(sut.errorMessage)
    }

    func testFetchCountryDetail_whenFailure_thenErrorMessageIsSet() async {
        // Arrange
        let repository = CountryDetailRepositoryMock()
        repository.error = URLError(.notConnectedToInternet)
        let sut = CountryDetailViewModel(repository: repository, countryCode: "CO")

        // Act
        await sut.fetchCountryDetail()

        // Assert
        XCTAssertNil(sut.countryDetail)
        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.errorMessage, "Failed to load country details")
    }
}

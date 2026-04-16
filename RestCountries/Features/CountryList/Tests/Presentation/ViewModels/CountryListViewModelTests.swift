import XCTest
@testable import RestCountries

@MainActor
final class CountryListViewModelTests: XCTestCase {

    func testFetchCountries_whenSuccess_thenCountriesArePopulated() async {
        // Arrange
        let repository = CountriesRepositoryMock()
        repository.result = [.mock]
        let sut = CountryListViewModel(repository: repository)

        // Act
        await sut.fetchCountries()

        // Assert
        XCTAssertEqual(sut.countries.count, 1)
        XCTAssertEqual(sut.countries.first?.name, "Spain")
        XCTAssertFalse(sut.isLoading)
        XCTAssertNil(sut.errorMessage)
    }

    func testFetchCountries_whenFailure_thenErrorMessageIsSet() async {
        // Arrange
        let repository = CountriesRepositoryMock()
        repository.error = URLError(.notConnectedToInternet)
        let sut = CountryListViewModel(repository: repository)

        // Act
        await sut.fetchCountries()

        // Assert
        XCTAssertTrue(sut.countries.isEmpty)
        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.errorMessage, "Failed to load countries")
    }

    func testFilteredCountries_whenSearchTextEmpty_thenReturnsAll() async {
        // Arrange
        let repository = CountriesRepositoryMock()
        repository.result = [
            .buildMock(name: "Spain", cca2: "ES"),
            .buildMock(name: "Germany", cca2: "DE"),
        ]
        let sut = CountryListViewModel(repository: repository)
        await sut.fetchCountries()

        // Act
        sut.searchText = ""

        // Assert
        XCTAssertEqual(sut.filteredCountries.count, 2)
    }

    func testFilteredCountries_whenSearchTextMatches_thenFiltersCorrectly() async {
        // Arrange
        let repository = CountriesRepositoryMock()
        repository.result = [
            .buildMock(name: "Spain", cca2: "ES"),
            .buildMock(name: "Germany", cca2: "DE"),
        ]
        let sut = CountryListViewModel(repository: repository)
        await sut.fetchCountries()

        // Act
        sut.searchText = "Spain"

        // Assert
        XCTAssertEqual(sut.filteredCountries.count, 1)
        XCTAssertEqual(sut.filteredCountries.first?.name, "Spain")
    }

    func testFilteredCountries_whenSearchByRegion_thenFiltersCorrectly() async {
        // Arrange
        let repository = CountriesRepositoryMock()
        repository.result = [
            .buildMock(name: "Spain", cca2: "ES", region: "Europe"),
            .buildMock(name: "Japan", cca2: "JP", region: "Asia"),
        ]
        let sut = CountryListViewModel(repository: repository)
        await sut.fetchCountries()

        // Act
        sut.searchText = "Asia"

        // Assert
        XCTAssertEqual(sut.filteredCountries.count, 1)
        XCTAssertEqual(sut.filteredCountries.first?.name, "Japan")
    }

    func testFilteredCountries_whenNoMatch_thenReturnsEmpty() async {
        // Arrange
        let repository = CountriesRepositoryMock()
        repository.result = [.mock]
        let sut = CountryListViewModel(repository: repository)
        await sut.fetchCountries()

        // Act
        sut.searchText = "zzz"

        // Assert
        XCTAssertTrue(sut.filteredCountries.isEmpty)
    }
}

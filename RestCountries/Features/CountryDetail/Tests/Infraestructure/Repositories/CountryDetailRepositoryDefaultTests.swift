import XCTest
@testable import RestCountries

final class CountryDetailRepositoryDefaultTests: XCTestCase {

    // MARK: - Properties

    private var dataSourceMock: CountryDetailDataSourceMock!
    private var sut: CountryDetailRepositoryDefault!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        dataSourceMock = CountryDetailDataSourceMock()
        sut = CountryDetailRepositoryDefault(dataSource: dataSourceMock)
    }

    // MARK: - Tests

    func testFetchCountryDetail_whenDataSourceReturnsValidDTO_thenReturnsMappedCountryDetail() async throws {
        // Arrange
        dataSourceMock.result = .mock

        // Act
        let detail = try await sut.fetchCountryDetail(code: "CO")

        // Assert
        XCTAssertEqual(detail.name, "Colombia")
        XCTAssertEqual(detail.cca2, "CO")
        XCTAssertEqual(detail.capitals, ["Bogotá"])
        XCTAssertEqual(detail.population, 53057212)
    }

    func testFetchCountryDetail_whenDataSourceReturnsInvalidDTO_thenThrowsInvalidDataError() async {
        // Arrange
        dataSourceMock.result = .buildMock(cca2: nil)

        // Act & Assert
        do {
            _ = try await sut.fetchCountryDetail(code: "XX")
            XCTFail("Expected error to be thrown")
        } catch let error as CountryDetailRepositoryError {
            XCTAssertEqual(error, .invalidData)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testFetchCountryDetail_whenDataSourceFails_thenThrowsError() async {
        // Arrange
        dataSourceMock.error = NSError(domain: "test", code: 1)

        // Act & Assert
        do {
            _ = try await sut.fetchCountryDetail(code: "CO")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual((error as NSError).domain, "test")
        }
    }
}

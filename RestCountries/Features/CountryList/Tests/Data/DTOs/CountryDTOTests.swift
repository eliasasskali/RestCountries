import XCTest
@testable import RestCountries

final class CountryDTOTests: XCTestCase {

    func testCountryDTO_whenDecoding_thenDTOIsCorrect() throws {
        // Arrange
        let data = try JSONLoader.load("Countries")

        // Act
        let dto = try JSONDecoder().decode([CountryDTO].self, from: data).first

        // Assert
        XCTAssertEqual(dto?.name?.common, "Spain")
        XCTAssertEqual(dto?.name?.official, "Kingdom of Spain")
        XCTAssertEqual(dto?.flags?.png, "https://flagcdn.com/w320/es.png")
        XCTAssertEqual(dto?.flags?.svg, "https://flagcdn.com/es.svg")
        XCTAssertEqual(dto?.flags?.alt, "The flag of Spain is composed of two equal horizontal bands of red and a wider central band of yellow.")
        XCTAssertEqual(dto?.cca2, "ES")
        XCTAssertEqual(dto?.region, "Europe")
    }

    func testCountryDTO_whenFieldsMissing_thenOptionalsAreNil() throws {
        // Arrange
        let json = #"[{"cca2": "XX"}]"#
        let data = Data(json.utf8)

        // Act
        let dto = try JSONDecoder().decode([CountryDTO].self, from: data).first

        // Assert
        XCTAssertEqual(dto?.cca2, "XX")
        XCTAssertNil(dto?.name)
        XCTAssertNil(dto?.flags)
        XCTAssertNil(dto?.region)
    }
}

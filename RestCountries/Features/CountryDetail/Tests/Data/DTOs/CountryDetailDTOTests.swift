import XCTest
@testable import RestCountries

final class CountryDetailDTOTests: XCTestCase {

    func testCountryDetailDTO_whenDecoding_thenDTOIsCorrect() throws {
        // Arrange
        let data = try JSONLoader.load("CountryDetail")

        // Act
        let dto = try JSONDecoder().decode(CountryDetailDTO.self, from: data)

        // Assert
        XCTAssertEqual(dto.name?.common, "Colombia")
        XCTAssertEqual(dto.name?.official, "Republic of Colombia")
        XCTAssertEqual(dto.flags?.png, "https://flagcdn.com/w320/co.png")
        XCTAssertEqual(dto.cca2, "CO")
        XCTAssertEqual(dto.region, "Americas")
        XCTAssertEqual(dto.capital, ["Bogotá"])
        XCTAssertEqual(dto.population, 53057212)
        XCTAssertEqual(dto.area, 1141748.0)
        XCTAssertEqual(dto.languages?["spa"], "Spanish")
        XCTAssertEqual(dto.currencies?["COP"]?.name, "Colombian peso")
        XCTAssertEqual(dto.currencies?["COP"]?.symbol, "$")
        XCTAssertEqual(dto.borders, ["BRA", "ECU", "PAN", "PER", "VEN"])
        XCTAssertEqual(dto.timezones, ["UTC-05:00"])
        XCTAssertEqual(dto.continents, ["South America"])
    }

    func testCountryDetailDTO_whenFieldsMissing_thenOptionalsAreNil() throws {
        // Arrange
        let json = #"{"cca2": "XX"}"#
        let data = Data(json.utf8)

        // Act
        let dto = try JSONDecoder().decode(CountryDetailDTO.self, from: data)

        // Assert
        XCTAssertEqual(dto.cca2, "XX")
        XCTAssertNil(dto.name)
        XCTAssertNil(dto.flags)
        XCTAssertNil(dto.region)
        XCTAssertNil(dto.capital)
        XCTAssertNil(dto.population)
        XCTAssertNil(dto.area)
        XCTAssertNil(dto.languages)
        XCTAssertNil(dto.currencies)
        XCTAssertNil(dto.borders)
        XCTAssertNil(dto.timezones)
        XCTAssertNil(dto.continents)
    }
}

import XCTest
@testable import RestCountries

final class CountryDTOMapperTests: XCTestCase {

    func testToDomain_whenAllFieldsPresent_thenReturnsCountry() {
        // Arrange
        let dto = CountryDTO.mock

        // Act
        let country = dto.toDomain()

        // Assert
        XCTAssertEqual(country?.name, "Spain")
        XCTAssertEqual(country?.cca2, "ES")
        XCTAssertEqual(country?.region, "Europe")
        XCTAssertEqual(country?.flag.url.absoluteString, "https://flagcdn.com/w320/es.png")
        XCTAssertEqual(country?.flag.alt, "The flag of Spain is composed of two equal horizontal bands of red and a wider central band of yellow.")
    }

    func testToDomain_whenCca2Missing_thenReturnsNil() {
        // Arrange
        let dto = CountryDTO.buildMock(cca2: nil)

        // Act
        let country = dto.toDomain()

        // Assert
        XCTAssertNil(country)
    }

    func testToDomain_whenNameMissing_thenReturnsNil() {
        // Arrange
        let dto = CountryDTO.buildMock(name: nil)

        // Act
        let country = dto.toDomain()

        // Assert
        XCTAssertNil(country)
    }

    func testToDomain_whenFlagsMissing_thenReturnsNil() {
        // Arrange
        let dto = CountryDTO.buildMock(flags: nil)

        // Act
        let country = dto.toDomain()

        // Assert
        XCTAssertNil(country)
    }

    func testToDomain_whenFlagURLInvalid_thenReturnsNil() {
        // Arrange
        let dto = CountryDTO.buildMock(
            flags: .buildMock(png: nil, svg: nil)
        )

        // Act
        let country = dto.toDomain()

        // Assert
        XCTAssertNil(country)
    }

    func testToDomain_whenCommonNameNil_thenUsesOfficialName() {
        // Arrange
        let dto = CountryDTO.buildMock(
            name: .buildMock(common: nil, official: "Kingdom of Spain")
        )

        // Act
        let country = dto.toDomain()

        // Assert
        XCTAssertEqual(country?.name, "Kingdom of Spain")
    }

    func testToDomain_whenPngNil_thenReturnsNil() {
        // Arrange
        let dto = CountryDTO.buildMock(
            flags: .buildMock(png: nil, svg: "https://flagcdn.com/es.svg")
        )

        // Act
        let country = dto.toDomain()

        // Assert
        XCTAssertNil(country)
    }

    func testToDomain_whenSvgNil_thenUsesPngUrl() {
        // Arrange
        let dto = CountryDTO.buildMock(
            flags: .buildMock(png: "https://flagcdn.com/w320/es.png", svg: nil)
        )

        // Act
        let country = dto.toDomain()

        // Assert
        XCTAssertEqual(country?.flag.url.absoluteString, "https://flagcdn.com/w320/es.png")
    }
}

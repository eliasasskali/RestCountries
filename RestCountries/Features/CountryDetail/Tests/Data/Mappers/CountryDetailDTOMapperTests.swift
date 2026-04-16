import XCTest
@testable import RestCountries

final class CountryDetailDTOMapperTests: XCTestCase {

    // MARK: - Success

    func testToDomain_whenAllFieldsPresent_thenReturnsCountryDetail() {
        let dto = CountryDetailDTO.mock
        let detail = dto.toDomain()

        XCTAssertEqual(detail?.name, "Colombia")
        XCTAssertEqual(detail?.officialName, "Republic of Colombia")
        XCTAssertEqual(detail?.cca2, "CO")
        XCTAssertEqual(detail?.region, "Americas")
        XCTAssertEqual(detail?.capitals, ["Bogotá"])
        XCTAssertEqual(detail?.population, 53057212)
        XCTAssertEqual(detail?.area, 1141748.0)
        XCTAssertEqual(detail?.languages, ["Spanish"])
        XCTAssertEqual(detail?.currencies.count, 1)
        XCTAssertEqual(detail?.currencies.first?.code, "COP")
        XCTAssertEqual(detail?.currencies.first?.name, "Colombian peso")
        XCTAssertEqual(detail?.currencies.first?.symbol, "$")
        XCTAssertEqual(detail?.borders, ["BRA", "ECU", "PAN", "PER", "VEN"])
        XCTAssertEqual(detail?.timezones, ["UTC-05:00"])
        XCTAssertEqual(detail?.continents, ["South America"])
        XCTAssertEqual(detail?.flag.url.absoluteString, "https://flagcdn.com/w320/co.png")
        XCTAssertEqual(detail?.flag.alt, "The flag of Colombia is composed of three horizontal bands of yellow, blue and red, with the yellow band twice the height of the other two bands.")
    }

    func testToDomain_whenOfficialNameNil_thenOfficialNameIsNil() {
        let dto = CountryDetailDTO.buildMock(
            name: .buildMock(common: "Colombia", official: nil)
        )
        let detail = dto.toDomain()

        XCTAssertNil(detail?.officialName)
    }

    func testToDomain_whenOfficialNameSameAsCommon_thenOfficialNameIsNil() {
        let dto = CountryDetailDTO.buildMock(
            name: .buildMock(common: "Colombia", official: "Colombia")
        )
        let detail = dto.toDomain()

        XCTAssertNil(detail?.officialName)
    }

    func testToDomain_whenCommonNameNil_thenUsesOfficialName() {
        let dto = CountryDetailDTO.buildMock(
            name: .buildMock(common: nil, official: "Republic of Colombia")
        )
        let detail = dto.toDomain()

        XCTAssertEqual(detail?.name, "Republic of Colombia")
    }

    // MARK: - Required fields missing → nil

    func testToDomain_whenCca2Missing_thenReturnsNil() {
        let dto = CountryDetailDTO.buildMock(cca2: nil)
        XCTAssertNil(dto.toDomain())
    }

    func testToDomain_whenNameMissing_thenReturnsNil() {
        let dto = CountryDetailDTO.buildMock(name: nil)
        XCTAssertNil(dto.toDomain())
    }

    func testToDomain_whenFlagsMissing_thenReturnsNil() {
        let dto = CountryDetailDTO.buildMock(flags: nil)
        XCTAssertNil(dto.toDomain())
    }

    func testToDomain_whenPngNil_thenReturnsNil() {
        let dto = CountryDetailDTO.buildMock(
            flags: .buildMock(png: nil, svg: "https://flagcdn.com/co.svg")
        )
        XCTAssertNil(dto.toDomain())
    }

    // MARK: - Optional fields missing → defaults

    func testToDomain_whenOptionalFieldsNil_thenUsesDefaults() {
        let dto = CountryDetailDTO.buildMock(
            region: nil,
            capital: nil,
            population: nil,
            area: nil,
            languages: nil,
            currencies: nil,
            borders: nil,
            timezones: nil,
            continents: nil
        )
        let detail = dto.toDomain()

        XCTAssertNotNil(detail)
        XCTAssertNil(detail?.region)
        XCTAssertEqual(detail?.capitals, [])
        XCTAssertNil(detail?.population)
        XCTAssertNil(detail?.area)
        XCTAssertEqual(detail?.languages, [])
        XCTAssertEqual(detail?.currencies, [])
        XCTAssertEqual(detail?.borders, [])
        XCTAssertEqual(detail?.timezones, [])
        XCTAssertEqual(detail?.continents, [])
    }

    func testToDomain_whenMultipleCapitals_thenReturnsAll() {
        let dto = CountryDetailDTO.buildMock(
            capital: ["Pretoria", "Cape Town", "Bloemfontein"]
        )
        let detail = dto.toDomain()

        XCTAssertEqual(detail?.capitals, ["Pretoria", "Cape Town", "Bloemfontein"])
    }

    func testToDomain_whenMultipleCurrencies_thenSortedByCode() {
        let dto = CountryDetailDTO.buildMock(
            currencies: [
                "ZAR": .buildMock(name: "South African rand", symbol: "R"),
                "EUR": .buildMock(name: "Euro", symbol: "€")
            ]
        )
        let detail = dto.toDomain()

        XCTAssertEqual(detail?.currencies.count, 2)
        XCTAssertEqual(detail?.currencies[0].code, "EUR")
        XCTAssertEqual(detail?.currencies[1].code, "ZAR")
    }

    func testToDomain_whenCurrencyNameNil_thenUsesCodeAsName() {
        let dto = CountryDetailDTO.buildMock(
            currencies: ["USD": .buildMock(name: nil, symbol: "$")]
        )
        let detail = dto.toDomain()

        XCTAssertEqual(detail?.currencies.first?.name, "USD")
    }

    func testToDomain_whenMultipleLanguages_thenSortedAlphabetically() {
        let dto = CountryDetailDTO.buildMock(
            languages: ["fra": "French", "ara": "Arabic", "eng": "English"]
        )
        let detail = dto.toDomain()

        XCTAssertEqual(detail?.languages, ["Arabic", "English", "French"])
    }
}

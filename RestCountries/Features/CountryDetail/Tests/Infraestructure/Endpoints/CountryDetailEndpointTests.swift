import XCTest
import NetworkKit
@testable import RestCountries

final class CountryDetailEndpointTests: XCTestCase {

    func testCountryDetailEndpoint_whenGetURLRequest_thenReturnsCorrectURL() throws {
        // Arrange
        let sut = CountryDetailEndpoint(code: "CO")

        // Act
        let request = try sut.asURLRequest()
        let components = URLComponents(
            url: try XCTUnwrap(request.url),
            resolvingAgainstBaseURL: false
        )
        let queryItems = try XCTUnwrap(components?.queryItems)

        // Assert
        XCTAssertEqual(request.url?.host, "restcountries.com")
        XCTAssertEqual(request.url?.path, "/v3.1/alpha/CO")
        XCTAssertTrue(queryItems.contains(URLQueryItem(
            name: "fields",
            value: "name,flags,cca2,region,capital,population,area,languages,currencies,borders,timezones,continents"
        )))
    }

    func testCountryDetailEndpoint_whenCustomFields_thenQueryContainsOnlyThoseFields() throws {
        // Arrange
        let sut = CountryDetailEndpoint(code: "ES", fields: [.name, .population])

        // Act
        let request = try sut.asURLRequest()
        let components = URLComponents(
            url: try XCTUnwrap(request.url),
            resolvingAgainstBaseURL: false
        )
        let queryItems = try XCTUnwrap(components?.queryItems)

        // Assert
        XCTAssertEqual(request.url?.path, "/v3.1/alpha/ES")
        XCTAssertTrue(queryItems.contains(URLQueryItem(name: "fields", value: "name,population")))
    }
}

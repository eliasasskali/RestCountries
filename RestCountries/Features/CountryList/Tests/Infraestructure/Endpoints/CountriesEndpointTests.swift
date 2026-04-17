import XCTest
import NetworkKit
@testable import RestCountries

final class CountriesEndpointTests: XCTestCase {

    func testCountriesEndpoint_whenGetURLRequest_thenReturnsCorrectURL() throws {
        // Arrange
        let sut = CountriesEndpoint()

        // Act
        let request = try sut.asURLRequest()
        let components = URLComponents(
            url: try XCTUnwrap(request.url),
            resolvingAgainstBaseURL: false
        )
        let queryItems = try XCTUnwrap(components?.queryItems)

        // Assert
        XCTAssertEqual(request.url?.host, "restcountries.com")
        XCTAssertEqual(request.url?.path, "/v3.1/all")
        XCTAssertTrue(queryItems.contains(URLQueryItem(name: "fields", value: "name,flags,cca2,region")))
    }

    func testCountriesEndpoint_whenCustomFields_thenQueryContainsOnlyThoseFields() throws {
        // Arrange
        let sut = CountriesEndpoint(fields: [.name, .cca2])

        // Act
        let request = try sut.asURLRequest()
        let components = URLComponents(
            url: try XCTUnwrap(request.url),
            resolvingAgainstBaseURL: false
        )
        let queryItems = try XCTUnwrap(components?.queryItems)

        // Assert
        XCTAssertTrue(queryItems.contains(URLQueryItem(name: "fields", value: "name,cca2")))
    }
}

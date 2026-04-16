@testable import RestCountries

extension Country {
    static var mock: Country { buildMock() }

    static func buildMock(
        name: String = "Spain",
        flag: CountryFlag = .mock,
        cca2: String = "ES",
        region: String? = "Europe"
    ) -> Country {
        Country(
            name: name,
            flag: flag,
            cca2: cca2,
            region: region
        )
    }
}

@testable import RestCountries

extension CountryDetailDTO {
    static var mock: CountryDetailDTO { buildMock() }

    static func buildMock(
        name: CountryDetailNameDTO? = .mock,
        flags: CountryDetailFlagsDTO? = .mock,
        cca2: String? = "CO",
        region: String? = "Americas",
        capital: [String]? = ["Bogotá"],
        population: Int? = 53057212,
        area: Double? = 1141748.0,
        languages: [String: String]? = ["spa": "Spanish"],
        currencies: [String: CountryDetailCurrencyDTO]? = ["COP": .mock],
        borders: [String]? = ["BRA", "ECU", "PAN", "PER", "VEN"],
        timezones: [String]? = ["UTC-05:00"],
        continents: [String]? = ["South America"]
    ) -> CountryDetailDTO {
        CountryDetailDTO(
            name: name,
            flags: flags,
            cca2: cca2,
            region: region,
            capital: capital,
            population: population,
            area: area,
            languages: languages,
            currencies: currencies,
            borders: borders,
            timezones: timezones,
            continents: continents
        )
    }
}

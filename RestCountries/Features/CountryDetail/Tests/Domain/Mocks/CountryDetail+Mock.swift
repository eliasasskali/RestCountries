@testable import RestCountries
import Foundation

extension CountryDetail {
    static var mock: CountryDetail { buildMock() }

    static func buildMock(
        name: String = "Colombia",
        officialName: String? = "Republic of Colombia",
        flag: CountryFlag = .buildMock(
            url: URL(string: "https://flagcdn.com/w320/co.png")!,
            alt: "The flag of Colombia"
        ),
        cca2: String = "CO",
        region: String? = "Americas",
        capitals: [String] = ["Bogotá"],
        population: Int? = 53057212,
        area: Double? = 1141748.0,
        languages: [String] = ["Spanish"],
        currencies: [Currency] = [.mock],
        borders: [String] = ["BRA", "ECU", "PAN", "PER", "VEN"],
        timezones: [String] = ["UTC-05:00"],
        continents: [String] = ["South America"]
    ) -> CountryDetail {
        CountryDetail(
            name: name,
            officialName: officialName,
            flag: flag,
            cca2: cca2,
            region: region,
            capitals: capitals,
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

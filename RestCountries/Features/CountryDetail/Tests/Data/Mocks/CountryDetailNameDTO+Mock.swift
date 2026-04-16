@testable import RestCountries

extension CountryDetailNameDTO {
    static var mock: CountryDetailNameDTO { buildMock() }

    static func buildMock(
        common: String? = "Colombia",
        official: String? = "Republic of Colombia"
    ) -> CountryDetailNameDTO {
        CountryDetailNameDTO(
            common: common,
            official: official
        )
    }
}

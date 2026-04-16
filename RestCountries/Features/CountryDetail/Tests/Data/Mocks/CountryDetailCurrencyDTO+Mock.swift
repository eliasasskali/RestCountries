@testable import RestCountries

extension CountryDetailCurrencyDTO {
    static var mock: CountryDetailCurrencyDTO { buildMock() }

    static func buildMock(
        name: String? = "Colombian peso",
        symbol: String? = "$"
    ) -> CountryDetailCurrencyDTO {
        CountryDetailCurrencyDTO(
            name: name,
            symbol: symbol
        )
    }
}

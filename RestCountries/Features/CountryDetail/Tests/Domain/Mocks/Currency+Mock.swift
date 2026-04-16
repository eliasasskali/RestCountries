@testable import RestCountries

extension Currency {
    static var mock: Currency { buildMock() }

    static func buildMock(
        code: String = "COP",
        name: String = "Colombian peso",
        symbol: String? = "$"
    ) -> Currency {
        Currency(
            code: code,
            name: name,
            symbol: symbol
        )
    }
}

@testable import RestCountries
import Foundation

extension CountryFlag {
    static var mock: CountryFlag { buildMock() }

    static func buildMock(
        url: URL = URL(string: "https://flagcdn.com/w320/es.png")!,
        alt: String? = "The flag of Spain is composed of two equal horizontal bands of red and a wider central band of yellow."
    ) -> CountryFlag {
        CountryFlag(
            url: url,
            alt: alt
        )
    }
}

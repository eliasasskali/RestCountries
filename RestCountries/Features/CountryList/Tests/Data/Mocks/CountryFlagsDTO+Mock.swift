@testable import RestCountries

extension CountryFlagsDTO {
    static var mock: CountryFlagsDTO { buildMock() }

    static func buildMock(
        png: String? = "https://flagcdn.com/w320/es.png",
        svg: String? = "https://flagcdn.com/es.svg",
        alt: String? = "The flag of Spain is composed of two equal horizontal bands of red and a wider central band of yellow."
    ) -> CountryFlagsDTO {
        CountryFlagsDTO(
            png: png,
            svg: svg,
            alt: alt
        )
    }
}

@testable import RestCountries

extension CountryDetailFlagsDTO {
    static var mock: CountryDetailFlagsDTO { buildMock() }

    static func buildMock(
        png: String? = "https://flagcdn.com/w320/co.png",
        svg: String? = "https://flagcdn.com/co.svg",
        alt: String? = "The flag of Colombia is composed of three horizontal bands of yellow, blue and red, with the yellow band twice the height of the other two bands."
    ) -> CountryDetailFlagsDTO {
        CountryDetailFlagsDTO(
            png: png,
            svg: svg,
            alt: alt
        )
    }
}

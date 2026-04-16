@testable import RestCountries

extension CountryDTO {
    static var mock: CountryDTO { buildMock() }

    static func buildMock(
        name: CountryNameDTO? = .mock,
        flags: CountryFlagsDTO? = .mock,
        cca2: String? = "ES",
        region: String? = "Europe"
    ) -> CountryDTO {
        CountryDTO(
            name: name,
            flags: flags,
            cca2: cca2,
            region: region
        )
    }
}

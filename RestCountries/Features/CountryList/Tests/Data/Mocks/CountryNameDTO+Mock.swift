@testable import RestCountries

extension CountryNameDTO {
    static var mock: CountryNameDTO { buildMock() }

    static func buildMock(
        common: String? = "Spain",
        official: String? = "Kingdom of Spain"
    ) -> CountryNameDTO {
        CountryNameDTO(
            common: common,
            official: official
        )
    }
}

import Foundation

extension CountryDetailDTO {
    func toDomain() -> CountryDetail? {
        guard let cca2,
              let name = name?.common ?? name?.official,
              let flagUrlString = flags?.png,
              let flagURL = URL(string: flagUrlString)
        else { return nil }

        let official = self.name?.official
        let officialName = (official != nil && official != name) ? official : nil

        return CountryDetail(
            name: name,
            officialName: officialName,
            flag: CountryFlag(
                url: flagURL,
                alt: flags?.alt
            ),
            cca2: cca2,
            region: region,
            capitals: capital ?? [],
            population: population,
            area: area,
            languages: languages?.values.sorted() ?? [],
            currencies: currencies?.map { code, dto in
                Currency(
                    code: code,
                    name: dto.name ?? code,
                    symbol: dto.symbol
                )
            }.sorted(by: { $0.code < $1.code }) ?? [],
            borders: borders ?? [],
            timezones: timezones ?? [],
            continents: continents ?? []
        )
    }
}

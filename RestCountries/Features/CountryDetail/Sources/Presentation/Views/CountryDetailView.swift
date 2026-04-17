import Localization
import SwiftUI

struct CountryDetailView: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: CountryDetailViewModel

    // MARK: - Initializer

    init(viewModel: CountryDetailViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let detail = viewModel.countryDetail {
                content(for: detail)
            } else {
                NoContentView(message: Localizables.CountryDetail.notAvailableMessage)
            }
        }
        .navigationTitle(viewModel.countryDetail?.name ?? "")
        .navigationBarTitleDisplayMode(.large)
        .task {
            await viewModel.fetchCountryDetail()
        }
        .errorAlert(message: $viewModel.errorMessage)
    }
}

// MARK: - Content

private extension CountryDetailView {
    func content(for detail: CountryDetail) -> some View {
        ScrollView {
            VStack(spacing: 24) {
                flagSection(for: detail)
                infoSection(for: detail)
            }
            .padding()
        }
    }

    func flagSection(for detail: CountryDetail) -> some View {
        VStack(spacing: 8) {
            AsyncImage(url: detail.flag.url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 200)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .accessibilityLabel(detail.flag.alt ?? Localizables.AccessibilityLabels.countryFlagImage(flag: detail.name))
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 200)
                    .cornerRadius(8)
            }

            if let officialName = detail.officialName {
                Text(officialName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }

    func infoSection(for detail: CountryDetail) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            if let region = detail.region {
                infoRow(
                    title: Localizables.CountryDetail.region,
                    value: region
                )
            }

            if !detail.continents.isEmpty {
                infoRow(
                    title: Localizables.CountryDetail.continent,
                    value: detail.continents.joined(separator: ", ")
                )
            }

            if !detail.capitals.isEmpty {
                infoRow(
                    title: detail.capitals.count > 1 ? Localizables.CountryDetail.capitals : Localizables.CountryDetail.capital,
                    value: detail.capitals.joined(separator: ", ")
                )
            }

            if let population = detail.population {
                infoRow(
                    title: Localizables.CountryDetail.population,
                    value: population.formatted()
                )
            }

            if let area = detail.area {
                infoRow(
                    title: Localizables.CountryDetail.area,
                    value: Localizables.CountryDetail.areaValue(area.formatted())
                )
            }

            if !detail.languages.isEmpty {
                infoRow(
                    title: detail.languages.count > 1 ? Localizables.CountryDetail.languages : Localizables.CountryDetail.language,
                    value: detail.languages.joined(separator: ", ")
                )
            }

            if !detail.currencies.isEmpty {
                currenciesRow(detail.currencies)
            }

            if !detail.timezones.isEmpty {
                infoRow(
                    title: detail.timezones.count > 1 ? Localizables.CountryDetail.timezones : Localizables.CountryDetail.timezone,
                    value: detail.timezones.joined(separator: ", ")
                )
            }
        }
    }
}

// MARK: - Components

private extension CountryDetailView {
    func infoRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.body)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    func currenciesRow(_ currencies: [Currency]) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(currencies.count > 1 ? Localizables.CountryDetail.currencies : Localizables.CountryDetail.currency)
                .font(.caption)
                .foregroundColor(.secondary)
            ForEach(currencies, id: \.code) { currency in
                HStack(spacing: 4) {
                    Text(currency.name)
                        .font(.body)
                    if let symbol = currency.symbol {
                        Text("(\(symbol))")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

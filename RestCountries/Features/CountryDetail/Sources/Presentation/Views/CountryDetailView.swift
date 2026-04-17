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
                NoContentView(message: "Country details not available")
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
                    .accessibilityLabel(detail.flag.alt ?? "Flag of \(detail.name)")
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
                    title: "Region",
                    value: region
                )
            }

            if !detail.continents.isEmpty {
                infoRow(
                    title: "Continent",
                    value: detail.continents.joined(separator: ", ")
                )
            }

            if !detail.capitals.isEmpty {
                infoRow(
                    title: detail.capitals.count > 1 ? "Capitals" : "Capital",
                    value: detail.capitals.joined(separator: ", ")
                )
            }

            if let population = detail.population {
                infoRow(
                    title: "Population",
                    value: population.formatted()
                )
            }

            if let area = detail.area {
                infoRow(
                    title: "Area",
                    value: "\(area.formatted()) km²"
                )
            }

            if !detail.languages.isEmpty {
                infoRow(
                    title: detail.languages.count > 1 ? "Languages" : "Language",
                    value: detail.languages.joined(separator: ", ")
                )
            }

            if !detail.currencies.isEmpty {
                currenciesRow(detail.currencies)
            }

            if !detail.timezones.isEmpty {
                infoRow(
                    title: detail.timezones.count > 1 ? "Timezones" : "Timezone",
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
            Text(currencies.count > 1 ? "Currencies" : "Currency")
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

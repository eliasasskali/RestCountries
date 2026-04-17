//
//  CountriesListView.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import SwiftUI

struct CountriesListView: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: CountryListViewModel

    // MARK: - Initializer

    init(viewModel: CountryListViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            if viewModel.isLoading && viewModel.filteredCountries.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.filteredCountries.isEmpty {
                NoContentView(message: isSearching ? "No countries found" : "No countries available")
            } else {
                countryList
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Search countries")
        .task {
            await viewModel.fetchCountries()
        }
        .errorAlert(message: $viewModel.errorMessage)
    }
}

// MARK: - Private Helpers

private extension CountriesListView {
    var countryList: some View {
        List(viewModel.filteredCountries) { country in
            NavigationLink(value: country) {
                CountryListItemView(country: country)
            }
        }
        .listStyle(.plain)
        .refreshable {
            await viewModel.fetchCountries()
        }
    }

    var isSearching: Bool {
        !viewModel.searchText.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

// MARK: - Preview

#Preview {
    CountriesListView(
        viewModel: .init(
            repository: CountriesRepositoryDefault(
                countriesDataSource: CountriesDataSourceDefault()
            )
        )
    )
}

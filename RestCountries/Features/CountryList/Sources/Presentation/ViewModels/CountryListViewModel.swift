//
//  CountryListViewModel.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Combine
import Foundation
import Localization

@MainActor
final class CountryListViewModel: ObservableObject {

    // MARK: - Dependencies

    let repository: CountriesRepository

    // MARK: - State

    @Published private(set) var countries: [Country] = []
    @Published private(set) var isLoading: Bool = false
    @Published var searchText: String = ""
    @Published var errorMessage: String?

    // MARK: - Computed Properties

    var filteredCountries: [Country] {
        return if searchText.isEmpty {
            countries
        } else {
            filterCountries()
        }
    }

    var isSearching: Bool {
        !searchText.trimmingCharacters(in: .whitespaces).isEmpty
    }

    // MARK: - Initializer

    init(repository: CountriesRepository) {
        self.repository = repository
    }

    // MARK: - Public methods

    func fetchCountries() async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil

        do {
            countries = try await repository.fetchCountries()
        } catch {
            errorMessage = Localizables.Errors.failedToLoadCountries
        }
    }
}

// MARK: - Private Methods

private extension CountryListViewModel {
    func filterCountries() -> [Country] {
        return countries.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.region?.localizedCaseInsensitiveContains(searchText) == true
        }
    }
}

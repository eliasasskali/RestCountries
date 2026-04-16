//
//  ViewFactory.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import SwiftUI

@MainActor
enum ViewFactory {

    static func makeCountriesListView() -> CountriesListView {
        let dataSource = CountriesDataSourceDefault()
        let repository = CountriesRepositoryDefault(countriesDataSource: dataSource)
        let viewModel = CountryListViewModel(repository: repository)
        return CountriesListView(viewModel: viewModel)
    }
}

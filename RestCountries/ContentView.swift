//
//  ContentView.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 14/04/2026.
//

import Localization
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ViewFactory.makeCountriesListView()
                .navigationTitle(Localizables.CountryList.title)
                .navigationDestination(for: Country.self) { country in
                    ViewFactory.makeCountryDetailView(countryCode: country.cca2)
                }
        }
    }
}

#Preview {
    ContentView()
}

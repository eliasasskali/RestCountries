//
//  CountryRowView.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import Localization
import SwiftUI

struct CountryListItemView: View {

    // MARK: - Dependencies

    let country: Country

    // MARK: - Body

    var body: some View {
        HStack {
            flag
            info
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Private Helpers

private extension CountryListItemView {
    var flag: some View {
        AsyncImage(url: country.flag.url) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 30)
                .cornerRadius(4)
                .accessibilityLabel(country.flag.alt ?? Localizables.AccessibilityLabels.countryFlagImage(flag: country.name))
        } placeholder: {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 50, height: 30)
                .cornerRadius(4)
        }
    }

    var info: some View {
        VStack(alignment: .leading) {
            Text(country.name)
                .font(.headline)
            if let region = country.region {
                Text(region)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.leading, 8)
    }
}

#Preview {
    CountryListItemView(country: .init(
        name: "Germany",
        flag: .init(
            url: URL(string: "https://restcountries.com/data/deu.svg")!,
            alt: "Flag of Germany"
        ),
        cca2: "DE",
        region: "Europe"
    ))
}

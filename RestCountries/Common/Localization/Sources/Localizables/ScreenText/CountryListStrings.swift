//
//  CountryListStrings.swift
//  Localization
//
//  Created by Elias Asskali Assakali on 17/04/2026.
//

import Foundation

public extension Localizables {
    enum CountryList {

        public static var title: String {
            NSLocalizedString("country_list_title", bundle: .module, comment: "")
        }

        public static var noCountriesFound: String {
            NSLocalizedString("country_list_no_countries_found", bundle: .module, comment: "")
        }

        public static var noCountriesAvailable: String {
            NSLocalizedString("country_list_no_countries_available", bundle: .module, comment: "")
        }

        public static var searchPrompt: String {
            NSLocalizedString("country_list_search_prompt", bundle: .module, comment: "")
        }
    }
}

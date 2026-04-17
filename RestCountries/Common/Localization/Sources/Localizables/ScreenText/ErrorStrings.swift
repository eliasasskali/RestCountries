//
//  ErrorStrings.swift
//  Localization
//
//  Created by Elias Asskali Assakali on 17/04/2026.
//

import Foundation

public extension Localizables {
    enum Errors {

        public static var title: String {
            NSLocalizedString("error_title", bundle: .module, comment: "")
        }

        public static var failedToLoadCountries: String {
            NSLocalizedString("error_failed_to_load_countries", bundle: .module, comment: "")
        }

        public static var failedToLoadCountryDetails: String {
            NSLocalizedString("error_failed_to_load_country_details", bundle: .module, comment: "")
        }
    }
}

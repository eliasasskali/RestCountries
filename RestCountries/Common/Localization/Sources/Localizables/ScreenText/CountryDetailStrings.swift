//
//  File.swift
//  Localization
//
//  Created by Elias Asskali Assakali on 17/04/2026.
//

import Foundation

public extension Localizables {
    enum CountryDetail {

        public static var notAvailableMessage: String {
            NSLocalizedString("country_detail_not_available_message", bundle: .module, comment: "")
        }

        public static var region: String {
            NSLocalizedString("country_detail_region", bundle: .module, comment: "")
        }

        public static var continent: String {
            NSLocalizedString("country_detail_continent", bundle: .module, comment: "")
        }

        public static var capital: String {
            NSLocalizedString("country_detail_capital", bundle: .module, comment: "")
        }

        public static var capitals: String {
            NSLocalizedString("country_detail_capitals", bundle: .module, comment: "")
        }

        public static var population: String {
            NSLocalizedString("country_detail_population", bundle: .module, comment: "")
        }

        public static var area: String {
            NSLocalizedString("country_detail_area", bundle: .module, comment: "")
        }

        public static func areaValue(_ value: String) -> String {
            String(
                format: NSLocalizedString("country_detail_area_value", bundle: .module, comment: ""),
                value
            )
        }

        public static var language: String {
            NSLocalizedString("country_detail_language", bundle: .module, comment: "")
        }

        public static var languages: String {
            NSLocalizedString("country_detail_languages", bundle: .module, comment: "")
        }

        public static var currency: String {
            NSLocalizedString("country_detail_currency", bundle: .module, comment: "")
        }

        public static var currencies: String {
            NSLocalizedString("country_detail_currencies", bundle: .module, comment: "")
        }

        public static var timezone: String {
            NSLocalizedString("country_detail_timezone", bundle: .module, comment: "")
        }

        public static var timezones: String {
            NSLocalizedString("country_detail_timezones", bundle: .module, comment: "")
        }
    }
}

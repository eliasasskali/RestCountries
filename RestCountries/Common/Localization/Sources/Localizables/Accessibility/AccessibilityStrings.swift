//
//  File.swift
//  Localization
//
//  Created by Elias Asskali Assakali on 17/04/2026.
//

import Foundation

public extension Localizables {
    enum AccessibilityLabels {
        public static func countryFlagImage(flag: String) -> String {
            String(
                format: NSLocalizedString("accessibility_labels_country_flag_image", bundle: .module, comment: ""),
                flag
            )
        } // Flag of %@
    }
}

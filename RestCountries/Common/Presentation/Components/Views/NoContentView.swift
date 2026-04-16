//
//  NoContentView.swift
//  RestCountries
//
//  Created by Elias Asskali Assakali on 16/04/2026.
//

import SwiftUI

struct NoContentView: View {

    // MARK: - Dependencies

    let message: String

    // MARK: - Body

    var body: some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView {
                Label(message, systemImage: "tray")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
        } else {
            VStack(spacing: 16) {
                Image(systemName: "tray")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .foregroundColor(.gray)

                Text(message)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    VStack {
        NoContentView(message: "No countries found")
    }
}

# RestCountries

A SwiftUI iOS app that displays information about countries around the world, powered by the [REST Countries API](https://restcountries.com).

## Features

- **Country List** — Browse all countries with their flags, names, and regions. Includes search and pull-to-refresh.
- **Country Detail** — Tap a country to see detailed info: official name, capitals, population, area, languages, currencies, timezones, and continents.

## Architecture

The project follows **Clean Architecture**, with each feature split into four layers:

| Layer | Responsibility |
|---|---|
| **Data** | DTOs and data source protocols |
| **Domain** | Business models and repository protocols |
| **Infraestructure** | Concrete implementations of data sources, endpoints, and repositories |
| **Presentation** | Views and ViewModels |

```
RestCountries/
├── Common/                     # Shared code and local SPM packages
│   ├── DesignSystem/           # Reusable UI components (NoContentView, ErrorAlertModifier)
│   ├── Localization/           # Localized strings (String Catalog)
│   ├── NetworkKit/             # Network layer (Endpoint protocol, NetworkService)
│   └── Tests/                  # Shared test helpers and resources
├── Features/
│   ├── CountryList/            # Country list feature
│   │   ├── Sources/
│   │   │   ├── Data/
│   │   │   ├── Domain/
│   │   │   ├── Infraestructure/
│   │   │   └── Presentation/
│   │   └── Tests/
│   └── CountryDetail/          # Country detail feature (same structure)
├── ContentView.swift           # Navigation root
├── ViewFactory.swift           # Dependency injection
└── RestCountriesApp.swift      # App entry point
```

## Local SPM Packages

| Package | Purpose |
|---|---|
| **NetworkKit** | Protocol-based networking abstraction. Defines `Endpoint` and `NetworkService` for making API requests. |
| **DesignSystem** | Shared UI components and view modifiers used across features. |
| **Localization** | All user-facing strings, managed through a String Catalog for easy translation. |

## API

The app uses the [REST Countries API v3.1](https://restcountries.com/v3.1):

- `GET /all` — Fetches all countries (used by Country List)
- `GET /alpha/{code}` — Fetches a single country by its code (used by Country Detail)

## Requirements

- Xcode 16+
- iOS 17+
- Swift 6

import Combine
import Foundation

@MainActor
final class CountryDetailViewModel: ObservableObject {

    // MARK: - Dependencies

    private let repository: CountryDetailRepository
    private let countryCode: String

    // MARK: - State

    @Published private(set) var countryDetail: CountryDetail?
    @Published private(set) var isLoading: Bool = false
    @Published var errorMessage: String?

    // MARK: - Initializer

    init(repository: CountryDetailRepository, countryCode: String) {
        self.repository = repository
        self.countryCode = countryCode
    }

    // MARK: - Public methods

    func fetchCountryDetail() async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil

        do {
            countryDetail = try await repository.fetchCountryDetail(code: countryCode)
        } catch {
            errorMessage = "Failed to load country details"
        }
    }
}

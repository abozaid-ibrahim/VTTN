//
//  TaskListViewModel.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import Combine
import Foundation
import SwiftUI

final class TaskListViewModel: ObservableObject, AsyncImageURL {
    /// The current loading state of the UserInput details.
    @MainActor @Published var state: LoadingDataState<Tasks> = .isLoading

    /// The client responsible for fetching UserInput details from the API.
    private let apiClient: APIClient

    /// Initializes a new instance of `TaskListViewModel`.
    ///
    /// - Parameters:
    ///   - apiClient: The client responsible for fetching details from the API. Default is `NetworkAPIClient`.
    init(apiClient: APIClient = NetworkAPIClient()) {
        self.apiClient = apiClient
    }

    /// Fetches details for the associated UserInput node asynchronously.
    @MainActor
    func fetchData() async {
        state = .isLoading
        do {
            state = try .success([]) // await fetchTasksList()
        } catch {
            state = .failure(error.localizedDescription)
        }
    }

//    private func fetchTasksList() async throws -> Tasks {
//        try await UserInput(priority: .background) {
//            try await apiClient.fetchData(for: .init(path: "list"))
//        }.value
//    }
}

//
//  TaskDetailsViewModel.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import Combine
import CoreFoundation
import SwiftUI
import UIKit

final class TaskDetailsViewModel: ObservableObject, AsyncImageURL {
    private(set) var Task: Task
    @Published var state: LoadingDataState<Task> = .isLoading
    @Published var deviceOrientation = UIDevice.current.orientation

    init(Task: Task) {
        self.Task = Task
        state = .success(Task)
    }

}

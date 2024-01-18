//
//  LoadingDataState.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import Foundation

/// Represents the loading state of UserInput details.
enum LoadingDataState<T> {
    /// Indicates that UserInput details are currently being loaded.
    case isLoading
    /// Indicates that an error occurred while fetching UserInput details.
    case failure(String)
    /// Indicates data were successfully loaded.
    case success(T)
}

//
//  LoadingDataState.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import Foundation

/// Represents the loading state of Task details.
enum LoadingDataState<T> {
    /// Indicates that Task details are currently being loaded.
    case isLoading
    /// Indicates that an error occurred while fetching Task details.
    case failure(String)
    /// Indicates data were successfully loaded.
    case success(T)
}

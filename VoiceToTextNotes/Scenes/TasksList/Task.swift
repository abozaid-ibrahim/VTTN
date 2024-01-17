//
//  Task.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import Foundation

typealias Tasks = [Task]
    struct Task: Identifiable, Equatable, Hashable {
        var id: String = UUID().uuidString
        var title: String
        var text: String
    }

extension Task {
    static let example: Self = .init(title: "", text: "")
}

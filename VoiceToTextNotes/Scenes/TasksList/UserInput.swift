//
//  UserInput.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import Foundation

typealias Tasks = [UserInput]
struct UserInput: Identifiable,Codable, Equatable, Hashable {
    var id: String = UUID().uuidString
//    var createdAt = Date()
    var text: String
    var filePath: String
}

extension UserInput {
    static let example: Self = .init(text: "", filePath: "")
}

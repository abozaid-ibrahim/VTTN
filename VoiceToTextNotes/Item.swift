//
//  Item.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 17.01.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

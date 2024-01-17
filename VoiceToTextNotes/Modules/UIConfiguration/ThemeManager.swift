//
//  ThemeManager.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import Foundation
import SwiftUI

final class ThemeManager: ObservableObject {
    @Published var current: Theme

    init(theme: Theme) {
        current = theme
    }
}

struct Theme {
    var primaryColor: Color
    var background: Color
}

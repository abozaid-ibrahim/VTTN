//
//  VoiceTexter.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 18.01.24.
//

import Foundation
import SwiftUI
import Speech

struct SpeechRecognitionView: View {
    @Environment(\.presentationMode) var presentationMode
    private let recognizer = SpeechRecognizer()
    var body: some View {
        VStack {
            Text(recognizer.transcribedText)
                .padding()

            Button("Start Listening") {
                try?  recognizer.startSpeechRecognition()
            }

            Button("Stop Listening") {
                recognizer.stopListening()
            }

            Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
    }

}

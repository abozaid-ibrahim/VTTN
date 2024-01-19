//
//  SpeechRecognitionView.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 18.01.24.
//

import SwiftUI

struct SpeechRecognitionView: View {
    @Environment(\.presentationMode) var presentationMode
    private let recognizer = VoiceTexterCoordinator()
    var body: some View {
        VStack(spacing: 40) {
            if let input = recognizer.userInput {
                Text(input.text)
                    .padding()
                AudioPlayerView(audioURL: input.filePath)
            }

            Button("Start Listening") {
                Task { await try! recognizer.start() }
            }

            Button("Stop Listening") {
                recognizer.stop()
            }

            Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
    }
}

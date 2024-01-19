//
//  VoiceTexterCoordinator.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 18.01.24.
//

import Foundation
final class VoiceTexterCoordinator {
    let recorder = VoiceRecorder()
    let recognizer = SpeechRecognizer()
    let cache = DataCache()
    @Published var userInput: UserInput?

    func start() async throws {
        await try? recognizer.startSpeechRecognition()
        try? recorder.startRecording()
    }

    func stop() {
        let record = recorder.stopListening()
        let text = recognizer.stopListening()
        userInput = .init(text: text, filePath: record?.absoluteString ?? "")
        cache.save(item: userInput!)
    }
}

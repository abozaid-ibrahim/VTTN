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
    @State private var transcribedText: String = ""
    @State private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    @State private var recognitionTask: SFSpeechRecognitionTask?
    @State private var audioEngine = AVAudioEngine()
    // Define `speechRecognizer` as a constant property of the view
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))

    var body: some View {
        VStack {
            Text(transcribedText)
                .padding()

            Button("Start Listening") {
              try?  startSpeechRecognition()
            }

            Button("Stop Listening") {
                stopListening()
            }

            Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
    }

    private func stopListening() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
        audioEngine.inputNode.removeTap(onBus: 0)
    }

   

    func requestPermission() async -> Bool {
        return await withCheckedContinuation { continuation in
            SFSpeechRecognizer.requestAuthorization { authStatus in
                switch authStatus {
                case .authorized:
                    continuation.resume(returning: true)
                case .denied, .restricted, .notDetermined:
                    continuation.resume(returning: false)
                @unknown default:
                    continuation.resume(returning: false)
                }
            }
        }
    }

     func startSpeechRecognition() throws {
        // Ensure the recognitionTask is stopped
        if let recognitionTask = recognitionTask {
            recognitionTask.cancel()
            self.recognitionTask = nil
        }

        // Configure the audio session
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)

        // Prepare the recognition request
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { return }

        recognitionRequest.shouldReportPartialResults = true

        // Prepare the audio input
        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            recognitionRequest.append(buffer)
        }

        // Start the audio engine
        audioEngine.prepare()
        try audioEngine.start()

        // Start the recognition task
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
            var isFinal = false

            if let result = result {
                // Update your UI with the result here
                 transcribedText = result.bestTranscription.formattedString
                isFinal = result.isFinal
            }

            if error != nil || isFinal {
                // Stop the audio engine and recognition task
                audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionTask = nil
                self.recognitionRequest = nil
            }
        }
    }

}

//
//  VoiceRecorder.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 18.01.24.
//

import AVFoundation
import Foundation
import SwiftUI

class VoiceRecorder {
    @State private var audioRecorder: AVAudioRecorder?
    @State private var audioRecordingURL: URL?

    func startRecording() throws {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.record()
            audioRecordingURL = audioFilename
        } catch {
            print("Could not start recording: \(error)")
        }
    }

    func saveRecording(audioRecording: UserInput) {
        do {
            let data = try JSONEncoder().encode(audioRecording)
            // Now save 'data' to UserDefaults, a file, or wherever you need
            UserDefaults.standard.set(data, forKey: "SavedRecording")
        } catch {
            print("Failed to encode audio recording: \(error)")
        }
    }

    func loadRecording() -> UserInput? {
        if let data = UserDefaults.standard.data(forKey: "SavedRecording") {
            do {
                let recording = try JSONDecoder().decode(UserInput.self, from: data)
                return recording
            } catch {
                print("Failed to decode audio recording: \(error)")
            }
        }
        return nil
    }

    func stopListening() -> URL? {
        audioRecorder?.stop()
        return audioRecordingURL
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

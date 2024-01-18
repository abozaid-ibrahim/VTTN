//
//  MediaPlayer.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 18.01.24.
//

import AVFoundation
import Foundation
import SwiftUI

struct AudioPlayerView: View {
    let audioURL: String
    let playerManager = AudioPlayerManager()

    var body: some View {
        Button("Play/Pause") {
            playerManager.togglePlayPause(from: URL(string: audioURL)!)
        }
    }
}

final class AudioPlayerManager: NSObject, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer?

    func playAudio(from url: URL) {
        do {
            // Initialize the audio player with the URL of the recording
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.play()
        } catch {
            print("Failed to initialize the audio player: \(error)")
        }
    }

    func pauseAudio() {
        // Pause the audio if it's currently playing
        if audioPlayer?.isPlaying == true {
            audioPlayer?.pause()
        }
    }

    func togglePlayPause(from url: URL) {
        // Check if the player is already playing
        if audioPlayer?.isPlaying == true {
            pauseAudio()
        } else {
            playAudio(from: url)
        }
    }
}

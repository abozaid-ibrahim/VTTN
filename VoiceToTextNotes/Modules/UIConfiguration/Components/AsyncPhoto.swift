//
//  AsyncPhoto.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import Foundation
import SwiftUI

struct AsyncTask: View {
    let url: URL?
    let width: CGFloat
    let height: CGFloat
    let isAnimated: Bool
    @State private var isLoaded = false

    init(url: URL?, width: CGFloat, height: CGFloat, isAnimated: Bool = false) {
        self.url = url
        self.width = width
        self.height = height
        self.isAnimated = isAnimated
    }

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
                .opacity(isLoaded ? 1 : 0) // Initially invisible, then fade in
                .animation(isAnimated ? .easeIn(duration: 0.3) : nil, value: isLoaded)
                .onAppear { isLoaded = true }
        } placeholder: {
            ProgressView()
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    AsyncTask(url: nil, width: 50, height: 50)
}

//
//  WebView.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import SwiftUI
import WebKit

// WebView Wrapper
struct WebView: UIViewRepresentable {
    let url: String

    func makeUIView(context _: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context _: Context) {
        let request = URLRequest(url: URL(string: url)!)
        uiView.load(request)
    }
}

#Preview {
    WebView(url: "UserInput.example.")
}

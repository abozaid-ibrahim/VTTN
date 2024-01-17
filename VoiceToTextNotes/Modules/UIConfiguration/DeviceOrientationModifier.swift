//
//  DeviceOrientationModifier.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 14.01.24.
//

import Combine
import SwiftUI

struct DeviceOrientationModifier: ViewModifier {
    @Binding var orientation: UIDeviceOrientation
    @State private var observer: NSObjectProtocol?

    func body(content: Content) -> some View {
        content
            .onAppear {
                UIDevice.current.beginGeneratingDeviceOrientationNotifications()
                observer = NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification,
                                                                  object: nil,
                                                                  queue: .main)
                { _ in
                    orientation = UIDevice.current.orientation
                }
            }
            .onDisappear {
                if let observer {
                    NotificationCenter.default.removeObserver(observer)
                }
                UIDevice.current.endGeneratingDeviceOrientationNotifications()
            }
    }
}

extension View {
    func onDeviceOrientationChange(_ orientation: Binding<UIDeviceOrientation>) -> some View {
        modifier(DeviceOrientationModifier(orientation: orientation))
    }
}

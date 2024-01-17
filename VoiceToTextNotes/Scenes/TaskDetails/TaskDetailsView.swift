//
//  TaskDetailsView.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 13.01.24.
//

import SwiftUI

struct TaskDetailsView: View {
    @ObservedObject private var viewModel: TaskDetailsViewModel
    @State private var showAuthorDetails = false
    @EnvironmentObject private var theme: ThemeManager

    init(Task: Task) {
        viewModel = .init(Task: Task)
    }

    var body: some View {
        VStack(alignment: .center) {
            switch viewModel.state {
            case .isLoading:
                ProgressView(Localized.Shared.loading)
            case let .failure(errorMessage):
                Text(errorMessage)
            case let .success(Task):
                GeometryReader { geometry in
                  
                    VStack {
                       
                        authCard(Task: Task)
                    }
                    .frame(width: geometry.size.width)
                }
                .onDeviceOrientationChange($viewModel.deviceOrientation)
            }
        }
        .background(theme.current.background)
        .navigationBarTitle("viewModel.Task.filename", displayMode: .inline)
    }

    private func authCard(Task: Task) -> some View {
        Text("Task.author")
            .font(.headline)
            .accessibilityAddTraits(.isButton)
            .foregroundColor(theme.current.primaryColor)
            .onTapGesture {
                self.showAuthorDetails = true
            }
            .sheet(isPresented: $showAuthorDetails) {
                WebView(url: "Task.authorUrl").presentationDetents([.medium])
            }
    }
}

struct TaskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsView(Task: .example)
    }
}

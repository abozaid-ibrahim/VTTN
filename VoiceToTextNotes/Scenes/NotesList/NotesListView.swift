//
//  NotesListView.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 18.01.24.
//

import SwiftUI

class NotesViewModel: ObservableObject {
    @Published var notes: [UserInput] = []
    // Functions to handle notes...
}

// Views
struct NotesListView: View {
    @ObservedObject var viewModel: NotesViewModel = .init()
    @State private var showingSheet = false

    var body: some View {
        NavigationView {
            List(viewModel.notes) { note in
                Text(note.text)
            }

            .sheet(isPresented: $showingSheet) {
                SpeechRecognitionView()
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: {
                showingSheet = true
            }) {
                Image(systemName: "plus")
            })
        }
    }
}

#Preview {
    NotesListView()
}

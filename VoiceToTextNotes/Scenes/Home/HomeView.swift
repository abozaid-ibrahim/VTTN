//
//  HomeView.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 17.01.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var tasksViewModel = TasksViewModel()
    @StateObject var notesViewModel = NotesViewModel()

    var body: some View {
        TabView {
            NotesListView(viewModel: notesViewModel)
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
            TasksListView(viewModel: tasksViewModel)
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }
        }
    }
}

// ViewModels
class TasksViewModel: ObservableObject {
    @Published var tasks: [UserInput] = []
    // Functions to handle tasks...
}

#Preview {
    HomeView()
}

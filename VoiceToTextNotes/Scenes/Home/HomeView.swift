//
//  HomeView.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 17.01.24.
//

import SwiftUI
import SwiftUI

struct HomeView: View {
    @StateObject var tasksViewModel = TasksViewModel()
    @StateObject var notesViewModel = NotesViewModel()

    var body: some View {
        TabView {
            TasksListView(viewModel: tasksViewModel)
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }

            NotesListView(viewModel: notesViewModel)
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
        }
    }
}



// ViewModels
class TasksViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    // Functions to handle tasks...
}


#Preview {
    HomeView()
}

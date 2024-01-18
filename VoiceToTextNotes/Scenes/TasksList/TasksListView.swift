//
//  TasksListView.swift
//  VoiceToTextNotes
//
//  Created by abuzeid on 17.01.24.
//

import SwiftUI

struct TasksListView: View {
    @ObservedObject var viewModel: TasksViewModel = .init()

    var body: some View {
        NavigationView {
            List(viewModel.tasks) { task in
                Text(task.text)
            }
            .navigationTitle("Tasks")
            .navigationBarItems(trailing: Button(action: {
                // Action to add new task
            }) {
                Image(systemName: "plus")
            })
        }
    }
}

#Preview {
    TasksListView()
}

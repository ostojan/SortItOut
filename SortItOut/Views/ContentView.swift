//
//  ContentView.swift
//  SortItOut
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query
    private var items: [ToDoItem]

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    ToDoItemRow(for: item)
                }
            }
            .navigationTitle("To Do")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(PreviewModelContainerProvider.shared.modelContainer)
}

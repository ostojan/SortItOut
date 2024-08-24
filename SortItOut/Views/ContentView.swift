//
//  ContentView.swift
//  SortItOut
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ToDoItemsListing(sort: [SortDescriptor(\.name)])
                .navigationTitle("To Do")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(PreviewModelContainerProvider.shared.modelContainer)
}

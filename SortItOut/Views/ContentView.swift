//
//  ContentView.swift
//  SortItOut
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State
    private var sortDescriptorProvider = ToDoItem.ToDoItemSortDescriptorProvider.done
    @State
    private var sortOrder = SortOrder.forward

    var body: some View {
        NavigationStack {
            ToDoItemsListing(sort: sortDescriptorProvider.sortDescriptors(order: sortOrder))
                .navigationTitle("To Do")
                .toolbar {
                    SortMenu(sortProvider: $sortDescriptorProvider.animation(), sortOrder: $sortOrder.animation())
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(PreviewModelContainerProvider.shared.modelContainer)
}

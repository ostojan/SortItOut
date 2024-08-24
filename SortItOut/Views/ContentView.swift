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
                    Menu {
                        ForEach(ToDoItem.ToDoItemSortDescriptorProvider.allCases) { provider in
                            Button {
                                withAnimation {
                                    if provider == sortDescriptorProvider {
                                        sortOrder = sortOrder == .forward ? .reverse : .forward
                                    } else {
                                        sortDescriptorProvider = provider
                                        sortOrder = .forward
                                    }
                                }
                            } label: {
                                if provider == sortDescriptorProvider {
                                    Label(
                                        provider.rawValue,
                                        systemImage: sortOrder == .forward ? "arrow.up" : "arrow.down"
                                    )
                                } else {
                                    Text(provider.rawValue)
                                }
                            }
                        }
                    } label: {
                        Label("Sort", systemImage: "arrow.left.arrow.right")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(PreviewModelContainerProvider.shared.modelContainer)
}

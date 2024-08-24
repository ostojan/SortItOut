//
//  ToDoItemsListing.swift
//  SortItOut
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftData
import SwiftUI

struct ToDoItemsListing: View {
    @Query
    private var items: [ToDoItem]

    init(sort sortDescriptors: [SortDescriptor<ToDoItem>]) {
        _items = Query(
            sort: sortDescriptors,
            animation: .default
        )
    }

    var body: some View {
        List {
            ForEach(items) { item in
                ToDoItemRow(for: item)
            }
        }
    }
}

#Preview {
    ToDoItemsListing(sort: [SortDescriptor(\.name)])
        .modelContainer(PreviewModelContainerProvider.shared.modelContainer)
}

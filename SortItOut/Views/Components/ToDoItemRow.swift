//
//  ToDoItemRow.swift
//  SortItOut
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftData
import SwiftUI

struct ToDoItemRow: View {
    private let toDoItem: ToDoItem

    init(for toDoItem: ToDoItem) {
        self.toDoItem = toDoItem
    }

    var body: some View {
        Button {
            toDoItem.done.toggle()
        } label: {
            HStack {
                Image(systemName: toDoItem.done ? "checkmark.circle" : "circle")
                    .font(.title)
                VStack(alignment: .leading) {
                    Text(toDoItem.name)
                        .font(.headline)
                        .strikethrough(toDoItem.done)
                    HStack {
                        LabeledContent("Creation date") {
                            Text(toDoItem.creationDate.formatted(date: .long, time: .omitted))
                        }
                        LabeledContent("Due date") {
                            Text(toDoItem.dueDate?.formatted(date: .long, time: .omitted) ?? "-")
                        }
                    }
                    .font(.caption2)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ToDoItemRow(for: PreviewModelContainerProvider.shared.toDoItem)
}

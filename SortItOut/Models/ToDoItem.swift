//
//  ToDoItem.swift
//  SortItOut
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import Foundation
import SwiftData

@Model
final class ToDoItem: Codable {
    private enum CodingKeys: CodingKey {
        case name
        case done
        case dueDate
        case creationDate
    }

    var name = ""
    var done = false
    var dueDate: Date?
    let creationDate = Date.now

    init(name: String = "", done: Bool = false, dueDate: Date? = nil) {
        self.name = name
        self.done = done
        self.dueDate = dueDate
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        done = try container.decode(Bool.self, forKey: .done)
        dueDate = try container.decodeIfPresent(Date.self, forKey: .dueDate)
        creationDate = try container.decode(Date.self, forKey: .creationDate)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(done, forKey: .done)
        if let dueDate {
            try container.encode(dueDate, forKey: .dueDate)
        }
        try container.encode(creationDate, forKey: .creationDate)
    }
}

extension ToDoItem {
    enum ToDoItemSortDescriptorProvider: String, CaseIterable, Identifiable {
        case name = "Name"
        case done = "Done"
        case dueDate = "Due Date"
        case creationDate = "Creation Date"

        var id: Self {
            self
        }

        func sortDescriptors(order: SortOrder) -> [SortDescriptor<ToDoItem>] {
            let doneDescriptor = SortDescriptor(\ToDoItem.done, order: order)
            let dueDateDescriptor = SortDescriptor(\ToDoItem.dueDate, order: order)
            let nameDescriptor = SortDescriptor(\ToDoItem.name, order: order)
            let creationDateDescriptor = SortDescriptor(\ToDoItem.creationDate, order: order)
            switch self {
            case .name:
                return [nameDescriptor, doneDescriptor, dueDateDescriptor, creationDateDescriptor]
            case .done:
                return [doneDescriptor, dueDateDescriptor, nameDescriptor, creationDateDescriptor]
            case .dueDate:
                return [dueDateDescriptor, doneDescriptor, nameDescriptor, creationDateDescriptor]
            case .creationDate:
                return [creationDateDescriptor, doneDescriptor, dueDateDescriptor, nameDescriptor]
            }
        }
    }
}

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

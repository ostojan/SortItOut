//
//  PreviewModelContainerProvider.swift
//  LookAtMyData
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftData
import UIKit

@MainActor
final class PreviewModelContainerProvider {
    static let shared = PreviewModelContainerProvider()

    private let toDoItems: [ToDoItem]
    let modelContainer: ModelContainer

    var modelContext: ModelContext {
        modelContainer.mainContext
    }

    var toDoItem: ToDoItem {
        guard let item = toDoItems.first else {
            fatalError("There is no data loaded")
        }
        return item
    }

    private init() {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            modelContainer = try ModelContainer(for: ToDoItem.self, configurations: configuration)
        } catch {
            fatalError("Could not create ModelContainer")
        }

        guard let previewData = NSDataAsset(name: "ToDoItemPreviewsData")?.data else {
            fatalError("Preview data not found")
        }

        do {
            toDoItems = try JSONDecoder().decode([ToDoItem].self, from: previewData)
            for toDoItem in toDoItems {
                modelContext.insert(toDoItem)
            }
        } catch {
            fatalError("Could not decode preview data")
        }
    }
}

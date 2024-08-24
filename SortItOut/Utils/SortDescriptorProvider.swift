//
//  SortDescriptorProvider.swift
//  SortItOut
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import Foundation
import SwiftData

protocol SortDescriptorProvider: CaseIterable, Identifiable, RawRepresentable where RawValue == String, AllCases: RandomAccessCollection {
    associatedtype Model: PersistentModel

    func sortDescriptors(order: SortOrder) -> [SortDescriptor<Model>]
}

extension SortDescriptorProvider {
    var id: Self {
        self
    }

    var name: String {
        rawValue
    }
}

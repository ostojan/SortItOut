//
//  SortMenu.swift
//  SortItOut
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import SwiftUI

struct SortMenu<Provider>: View where Provider: SortDescriptorProvider {
    @Binding
    private var sortProvider: Provider
    @Binding
    private var sortOrder: SortOrder

    init(sortProvider: Binding<Provider>, sortOrder: Binding<SortOrder>) {
        _sortProvider = sortProvider
        _sortOrder = sortOrder
    }

    var body: some View {
        Menu {
            ForEach(Provider.allCases) { provider in
                if provider == sortProvider {
                    currentProviderButton
                } else {
                    button(for: provider)
                }
            }
        } label: {
            Label("Sort", systemImage: "arrow.left.arrow.right")
        }
    }

    private var currentProviderButton: some View {
        Button {
            sortOrder = sortOrder == .forward ? .reverse : .forward
        } label: {
            Label(
                sortProvider.name,
                systemImage: sortOrder == .forward ? "arrow.up" : "arrow.down"
            )
        }
    }

    private func button(for provider: Provider) -> some View {
        Button {
            sortProvider = provider
            sortOrder = .forward
        } label: {
            Text(provider.name)
        }
    }
}

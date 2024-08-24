//
//  Bool+Comparable.swift
//  SortItOut
//
//  Copyright (c) 2024 Aleksander Stojanowski. All rights reserved.
//

import Foundation

extension Bool: Comparable {
    public static func < (lhs: Bool, rhs: Bool) -> Bool {
        !lhs && rhs
    }
}

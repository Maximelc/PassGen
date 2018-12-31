//
//  Array+Additions.swift
//  PassGen
//
//  Created by Maxime Le Coat on 30/12/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    /// Remove element from the array.
    ///
    /// - Parameter element: element to remove.
    public mutating func remove(_ element: Element) {
        if let elementIndex = self.index(of: element) {
            self.remove(at: elementIndex)
        }
    }
}

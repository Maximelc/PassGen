//
//  CharacterSet+Additions.swift
//  PassGen
//
//  Created by Maxime Le Coat on 30/12/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import Foundation

extension CharacterSet {
    
    /// Return set members as String array.
    public var members: [String] {
        return Array(unichar(0)..<unichar(128))
            .compactMap { UnicodeScalar($0) ?? nil }
            .filter { self.contains($0) }
            .map { String($0) }
    }
}

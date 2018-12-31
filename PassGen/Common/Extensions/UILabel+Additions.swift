//
//  UILabel+Additions.swift
//  PassGen
//
//  Created by Maxime Le Coat on 31/12/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import UIKit

extension UILabel {
    
    /// Apply default configuration for UILabel.
    ///
    /// - Parameter text: The current text that is displayed by the label.
    public final func applyDefaultSetup(with text: String?) {
        self.text = text
        self.numberOfLines = 0
    }
}

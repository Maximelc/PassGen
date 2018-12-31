//
//  UISwitch+Additions.swift
//  PassGen
//
//  Created by Maxime Le Coat on 31/12/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import UIKit

extension UISwitch {
    
    /// Apply default configuration for UISwitch.
    ///
    /// - Parameter action: The target object—that is, the object whose action method is called.
    public final func applyDefaultSetup(action: Selector) {
        self.onTintColor = ColorName.astralBlue.color
        self.addTarget(nil, action: action, for: .valueChanged)
    }
}

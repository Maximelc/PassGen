//
//  UIAlert+Additions.swift
//  PassGen
//
//  Created by Maxime Le Coat on 31/12/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import UIKit
import Foundation

// MARK: - UIAlertController
extension UIAlertController {
    
    /// Creates and returns a view controller for displaying an alert to the user.
    public convenience init(title: String?, message: String?) {
        self.init(title: title, message: message, preferredStyle: .alert)
    }
    
    /// Attaches actions objects to the alert or action sheet.
    public func addActions(_ actions: UIAlertAction...) {
        _ = actions.map { action in self.addAction(action) }
    }
}

// MARK: - UIAlertAction
extension UIAlertAction {
    
    /// An object that displays an alert message to the user.
    public convenience init(title: String?, handler: ((UIAlertAction) -> Void)? = nil) {
        self.init(title: title, style: .default, handler: handler)
    }
}

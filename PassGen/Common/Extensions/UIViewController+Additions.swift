//
//  UIViewController+Additions.swift
//  PassGen
//
//  Created by Maxime Le Coat on 31/12/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    
    /// Presents a view controller modally.
    public func present(_ viewControllerToPresent: UIViewController, completion: (() -> Void)? = nil) {
        self.present(viewControllerToPresent, animated: true, completion: completion)
    }
}

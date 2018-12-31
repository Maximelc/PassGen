//
//  PGLogger.swift
//  PassGen
//
//  Created by Maxime LE COAT on 12/29/18
//  Copyright (c) 2018 Maximelc. All rights reserved.
//

import Foundation
import SwiftyBeaver

let logger: SwiftyBeaver.Type = SwiftyBeaver.self

struct PGLogger {
    
    /// Apply SwiftyBeaver setup.
    static func setup() {
        let console: ConsoleDestination = ConsoleDestination()
        
        console.format = "$D[HH:mm:ss]$d $L - $N.$F:$l > $M"
        console.levelString.info = "📘 -- INFO"
        console.levelString.error = "📕 -- ERROR"
        console.levelString.debug = "📗 -- DEBUG"
        console.levelString.verbose = "📔 -- VERBOSE"
        console.levelString.warning = "📙 -- WARNING"
        
        logger.addDestination(console)
    }
}

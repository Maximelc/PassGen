//
//  PasswordManager.swift
//  PassGen
//
//  Created by Maxime Le Coat on 30/12/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import Foundation

final class PasswordManager {
    
    // MARK: - Public
    enum PasswordAttributes {
        case symbols
        case numbers
        case letters
    }
    
    /// Generated password.
    var password: String {
        return self.generatePassword()
    }
    
    /// Array of PasswordAttributes.
    var attributes: [PasswordAttributes]?
    
    /// Password length. Cannot be under 0.
    var length: Int? {
        willSet {
            self.length = (newValue ?? 0) < 0 ? 0 : newValue
        }
    }
    
    // MARK: - Privates
    private enum PassworKindData {
        
        /// Returns a character set containing the characters in Unicode General Category S* & P* as String Array.
        static let symbols: [String] = CharacterSet.symbols.members + CharacterSet.punctuationCharacters.members

        /// Returns a character set containing the characters in the category of Decimal Numbers as String Array.
        static let numbers: [String] = CharacterSet.decimalDigits.members
        
        /// Returns a character set containing the characters in Unicode General Category L* & M* as String Array.
        static let characters: [String] = CharacterSet.letters.members
    }
    
    // MARK: - Life cycle
    
    /// Initialize PasswordManager with PasswordAttributes and length.
    ///
    /// - Parameters:
    ///   - attributes: Array of PasswordAttributes.
    ///   - length: Password length.
    init(attributes: [PasswordAttributes], with length: Int) {
        self.attributes = attributes
        self.length = length
    }
}

// MARK: - Misc functions
extension PasswordManager {
    
    /// Generate passphrase from selected PasswordAttributes.
    ///
    /// - Returns: Array of String shuffled.
    private func generateDataList() -> [String] {
        guard let attributes = self.attributes else {
            logger.error("Failed to get PasswordAttributes instance.")
            return [String]()
        }
        
        var passwordData: [String] = [String]()
        
        _ = attributes.map { attribute in
            switch attribute {
            case .symbols: passwordData += PassworKindData.symbols.shuffled()
            case .numbers: passwordData += PassworKindData.numbers.shuffled()
            case .letters: passwordData += PassworKindData.characters.shuffled()
            }
        }
        
        return passwordData.shuffled()
    }
    
    /// Generate a new password.
    ///
    /// - Returns: Generated password as String.
    private func generatePassword() -> String {
        guard let length = self.length else {
            logger.error("Failed to get length instance.")
            return String()
        }
        
        var generatedPassword: String = String()
        let passwordData: [String] = self.generateDataList()
        
        for _ in 0..<length {
            guard let randomString = passwordData.randomElement() else {
                logger.error("Failed to get a random String from the collection.")
                break
            }
            generatedPassword += randomString
        }
        
        return generatedPassword
    }
}

// MARK: - Public functions
extension PasswordManager {
    
    /// Update the received attribute state from attributes list.
    ///
    /// - Parameters:
    ///   - currentAttribute: current attribute as PasswordAttributes.
    ///   - state: new state; true will add, false will remove from attributes list.
    public func updateAttribute(_ currentAttribute: PasswordAttributes, state: Bool) {
        state ?
            self.attributes?.append(currentAttribute) :
            self.attributes?.remove(currentAttribute)
    }
}

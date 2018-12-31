// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum Common {
    /// Close
    internal static let close = L10n.tr("Localizable", "common.close")
    /// Confirm
    internal static let confirm = L10n.tr("Localizable", "common.confirm")
    /// PassGen
    internal static let name = L10n.tr("Localizable", "common.name")
  }

  internal enum Pghomeviewcontroller {
    /// Length
    internal static let length = L10n.tr("Localizable", "PGHomeViewController.length")
    /// Letters
    internal static let letters = L10n.tr("Localizable", "PGHomeViewController.letters")
    /// Numbers
    internal static let numbers = L10n.tr("Localizable", "PGHomeViewController.numbers")
    /// Symbols
    internal static let symbols = L10n.tr("Localizable", "PGHomeViewController.symbols")
    /// Home
    internal static let title = L10n.tr("Localizable", "PGHomeViewController.title")

    internal enum Alert {
      /// Do you really want to replace your current clipboard with the new generated password ?
      internal static let subtitle = L10n.tr("Localizable", "PGHomeViewController.alert.subtitle")
      /// ⚠️ Warning ⚠️
      internal static let title = L10n.tr("Localizable", "PGHomeViewController.alert.title")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

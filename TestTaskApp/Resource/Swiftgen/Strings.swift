// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Details {
    /// Crew: %@
    public static func crew(_ p1: Any) -> String {
      return L10n.tr("Localizable", "details.crew", String(describing: p1), fallback: "Crew: %@")
    }
    /// IMDB: %@
    public static func imDbRating(_ p1: Any) -> String {
      return L10n.tr("Localizable", "details.imDbRating", String(describing: p1), fallback: "IMDB: %@")
    }
    /// Rank: %@
    public static func rank(_ p1: Any) -> String {
      return L10n.tr("Localizable", "details.rank", String(describing: p1), fallback: "Rank: %@")
    }
    /// Details of movie
    public static let title = L10n.tr("Localizable", "details.title", fallback: "Details of movie")
    /// Count title: %@
    public static func titleCount(_ p1: Any) -> String {
      return L10n.tr("Localizable", "details.titleCount", String(describing: p1), fallback: "Count title: %@")
    }
    /// Year: %@
    public static func year(_ p1: Any) -> String {
      return L10n.tr("Localizable", "details.year", String(describing: p1), fallback: "Year: %@")
    }
  }
  public enum List {
    /// Rank: %@
    public static func rank(_ p1: Any) -> String {
      return L10n.tr("Localizable", "list.rank", String(describing: p1), fallback: "Rank: %@")
    }
    /// Top movies
    public static let title = L10n.tr("Localizable", "list.title", fallback: "Top movies")
    public enum Movies {
      /// No movies
      public static let empty = L10n.tr("Localizable", "list.movies.empty", fallback: "No movies")
      /// Something went wrong
      public static let error = L10n.tr("Localizable", "list.movies.error", fallback: "Something went wrong")
      /// Loading...
      public static let loading = L10n.tr("Localizable", "list.movies.loading", fallback: "Loading...")
    }
    public enum Search {
      /// Name of movie
      public static let placeholder = L10n.tr("Localizable", "list.search.placeholder", fallback: "Name of movie")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type

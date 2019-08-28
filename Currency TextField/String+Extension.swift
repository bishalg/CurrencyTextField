//
//  String+Extension.swift
//
//  Created by Bishal Ghimire on 6/12/19.
//  Copyright © 2019 Bishal Ghimire. All rights reserved.
//

import Foundation

extension String {

  func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
    return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "**\(self)**")
  }

  /// formatting text for currency textField
  /// https://stackoverflow.com/a/40469426/1294448
  /*
   textField.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
   
   func myTextFieldDidChange(_ textField: UITextField) {
   if let amountString = textField.text?.currencyInputFormatting() {
   textField.text = amountString
   }
   }
   */
  func currencyInputFormatting() -> String {
    var number: NSNumber!
    let formatter = NumberFormatter()
    formatter.numberStyle = .currencyAccounting
    formatter.currencySymbol = "$"
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 2

    var amountWithPrefix = self

    // remove from String: "$", ".", ","
    let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
    amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: self.count), withTemplate: "")

    let double = (amountWithPrefix as NSString).doubleValue
    number = NSNumber(value: (double / 100))

    // if first number is 0 or all numbers were deleted
    guard number != 0 as NSNumber else {
      return ""
    }

    return formatter.string(from: number)!
  }

  func currencyFractionFormatting() -> String {
    var number: NSNumber!
    let formatter = NumberFormatter()
    formatter.numberStyle = .currencyAccounting
    formatter.currencySymbol = "$"
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 2
    let double = (self as NSString).doubleValue
    number = NSNumber(value: double)
    return formatter.string(from: number)!
  }

  func currencyToDouble() -> Double? {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    numberFormatter.locale = Locale.current
    return numberFormatter.number(from: self)?.doubleValue
  }

  func convertToCurrency() -> String? {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    numberFormatter.usesGroupingSeparator = true
    numberFormatter.locale = Locale.current
    return numberFormatter.number(from: self)?.stringValue
  }

  func removeFormatAmount() -> Double {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "en_US")
    formatter.numberStyle = .currency
    formatter.currencySymbol = "$"
    formatter.decimalSeparator = ","

    return formatter.number(from: self) as? Double ?? 0.00
  }

}

/// https://www.hackingwithswift.com/example-code/strings/how-to-remove-a-prefix-from-a-string
extension String {

  func deletingPrefix(_ prefix: String) -> String {
    guard self.hasPrefix(prefix) else { return self }
    return String(self.dropFirst(prefix.count))
  }

}

/// https://developer.apple.com/documentation/swift/string/2997150-removeall
extension String {

  /// Remove $ and % sign for text field
  /// Complexity: O(n), where n is the length of the collection.
  mutating func removeAllSymbols(_ symbols: Set<Character> = ["$", "%"]) {
    self.removeAll(where: { symbols.contains($0) })
  }

  func removeMathCurrencySymbols() -> String {
    var str = self
    str = str.removeMathSymbol()
    str = str.removeCurrencySymbol()
    return str
  }

  func removeCurrencySymbol() -> String {
    var str = self
    let symbols: Set<Character> = ["$", "R"]
    str.removeAll(where: { symbols.contains($0) })
    return str
  }

  func removeMathSymbol() -> String {
    var str = self
    let symbols: Set<Character> = ["%", "#", "/", "@", "!"]
    str.removeAll(where: { symbols.contains($0) })
    return str
  }

}

extension String {

  func decimalCountForText(_ text: String) -> Int {
    // guard let text = text else { return 0 }

    let numberOfDots = text.components(separatedBy: ".").count - 1

    let numberOfDecimalDigits: Int
    if let dotIndex = text.firstIndex(of: ".") {
      numberOfDecimalDigits = text.distance(from: dotIndex, to: text.endIndex) - 1
    } else {
      return numberOfDots // numberOfDecimalDigits = 0
    }
    return numberOfDecimalDigits + numberOfDots
  }

}

extension Double {

  func doubleToCurrency() -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    numberFormatter.locale = Locale.current
    return numberFormatter.string(from: NSNumber(value: self))!
  }

}

extension Float {

  var asLocaleCurrency: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale.current
    formatter.usesGroupingSeparator = true
    return formatter.string(from: NSNumber(value: self))!
  }

}

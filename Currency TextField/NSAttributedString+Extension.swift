//
//  NSAttributedString+Extension.swift
//
//  Created by Bishal Ghimire on 8/11/19.
//  Copyright © 2019 Bishal Ghimire. All rights reserved.
//

import UIKit

extension NSAttributedString {

  func decimalAttributedString(textColor: UIColor = .black) -> NSAttributedString? {
    if string.count == 0 { return nil }
    let attributedString = NSMutableAttributedString.init(string: self.string)
    let aAttributes = self.attributes(at: 0, effectiveRange: nil)

    guard let attributeFont = aAttributes[NSAttributedString.Key.font] as? UIFont else { return nil }
    let fontSize: CGFloat = 100.0 / 2.5 // attributeFont.pointSize / 2.5
    guard let font = UIFont(name: attributeFont.fontName, size: fontSize) else { return  attributedString }
    // let offset = font.ascender - font.capHeight + fontSize / 1.5
    let offset = (attributeFont.capHeight - font.capHeight)

    let numberOfDecimalDigits: Int
    let startLength: Int
    if let dotIndex = string.firstIndex(of: ".") {
      numberOfDecimalDigits = string.distance(from: dotIndex, to: string.endIndex)
      startLength = string.count - numberOfDecimalDigits
    } else {
      numberOfDecimalDigits = 0
      startLength = string.count - numberOfDecimalDigits
    }
    attributedString.setAttributes([NSAttributedString.Key.font: font as Any,
                                    NSAttributedString.Key.foregroundColor: textColor as Any,
                                    NSAttributedString.Key.baselineOffset: offset],
                                   range: NSRange(location: startLength, length: numberOfDecimalDigits))
    return attributedString
  }

  func currecyDecimalAttributedString(textColor: UIColor = .black) -> NSAttributedString? {
    if string.count == 0 { return nil }
    let attributedString = NSMutableAttributedString.init(string: self.string)
    let aAttributes = self.attributes(at: 0, effectiveRange: nil)

    guard let attributefont = aAttributes[NSAttributedString.Key.font] as? UIFont else { return nil }
    let fontSize =  CGFloat(124.0 / 2.5) /// attributefont.pointSize / 2.5
    guard let font = UIFont(name: attributefont.fontName, size: fontSize) else { return  attributedString }
    let offset = font.ascender - font.capHeight + fontSize / 1.5

    var numberOfCurrencyDigits: Int = 0
    if let currencyIndex = string.firstIndex(of: "$") {
      numberOfCurrencyDigits = string.distance(from: currencyIndex, to: string.startIndex) + 1
    }
    let currencyFont = UIFont.systemFont(ofSize: fontSize)
    attributedString.setAttributes([NSAttributedString.Key.font: currencyFont as Any,
                                    NSAttributedString.Key.foregroundColor: textColor as Any,
                                    NSAttributedString.Key.baselineOffset: offset],
                                   range: NSRange(location: 0, length: numberOfCurrencyDigits))

    let numberOfDecimalDigits: Int
    let startLength: Int
    if let dotIndex = string.firstIndex(of: ".") {
      numberOfDecimalDigits = string.distance(from: dotIndex, to: string.endIndex)
      startLength = string.count - numberOfDecimalDigits
    } else {
      numberOfDecimalDigits = 0
      startLength = string.count - numberOfDecimalDigits
    }
    attributedString.setAttributes([NSAttributedString.Key.font: font as Any,
                                    NSAttributedString.Key.foregroundColor: textColor as Any,
                                    NSAttributedString.Key.baselineOffset: offset],
                                   range: NSRange(location: startLength, length: numberOfDecimalDigits))
    return attributedString
  }

}

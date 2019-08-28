//
//  UILabel+Style.swift
//
//  Created by Bishal Ghimire on 7/27/19.
//  Copyright © 2019 Bishal Ghimire. All rights reserved.
//

import UIKit

extension UILabel {

  func attributedStringForDecimalCurrency() -> NSAttributedString? {
    guard let text = text else { return nil }
    let attributedString = NSMutableAttributedString.init(string: text)

    guard let textColor = textColor else { return nil }
    let fontSize: CGFloat =  48.0 // font.pointSize / 2.5
    guard let font = UIFont(name: font.fontName, size: fontSize) else { return  attributedString }
    let offset = font.ascender - font.capHeight + fontSize / 1.5

    var numberOfCurrencyDigits: Int = 0
    if let currencyIndex = text.firstIndex(of: "$") {
      numberOfCurrencyDigits = text.distance(from: currencyIndex, to: text.startIndex) + 1
    }
    let currencyFont =  UIFont.systemFont(ofSize: fontSize)
    attributedString.setAttributes([NSAttributedString.Key.font: currencyFont as Any,
                                    NSAttributedString.Key.foregroundColor: textColor as Any,
                                    NSAttributedString.Key.baselineOffset: offset],
                                   range: NSRange(location: 0, length: numberOfCurrencyDigits))

    let numberOfDecimalDigits: Int
    let startLength: Int
    if let dotIndex = text.firstIndex(of: ".") {
      numberOfDecimalDigits = text.distance(from: dotIndex, to: text.endIndex)
      startLength = text.count - numberOfDecimalDigits
    } else {
      numberOfDecimalDigits = 0
      startLength = text.count - numberOfDecimalDigits
    }
    attributedString.setAttributes([NSAttributedString.Key.font: font as Any,
                                    NSAttributedString.Key.foregroundColor: textColor as Any,
                                    NSAttributedString.Key.baselineOffset: offset],
                                   range: NSRange(location: startLength, length: numberOfDecimalDigits))
    return attributedString
  }

  func currencyHeaderLabel(_ labelFrame: CGRect = CGRect(x: 0, y: 0, width: 320, height: 180),
                           isEnabled: Bool = true,
                           fontSize: CGFloat = 100.0) {
    self.lineBreakMode = .byWordWrapping
    self.numberOfLines = 1
    self.textAlignment = .center
    self.font = UIFont.systemFont(ofSize: fontSize)
    self.minimumScaleFactor = 0.4
    self.textColor = isEnabled ? .myAppGreen : .gray
    self.attributedText = self.attributedStringForDecimalCurrency()
    self.sizeToFit()
    self.frame = labelFrame
  }

}

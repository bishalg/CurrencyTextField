//
//  UITextField+Extension.swift
//
//  Created by Bishal Ghimire on 8/3/19.
//  Copyright © 2019 Bishal Ghimire. All rights reserved.
//
/// https://stackoverflow.com/a/45450041/1294448

import UIKit

extension UITextField {

  /// textfield to limit the entry to max 2 decimal places.
  /// 12.34 is allowed but not 12.345
  func isCurrency(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let oldText = textField.text, let r = Range(range, in: oldText) else {
      return true
    }

    let newText = oldText.replacingCharacters(in: r, with: string)
    let isNumeric = newText.isEmpty || (Double(newText) != nil)
    let numberOfDots = newText.components(separatedBy: ".").count - 1

    let numberOfDecimalDigits: Int
    if let dotIndex = newText.firstIndex(of: ".") {
      numberOfDecimalDigits = newText.distance(from: dotIndex, to: newText.endIndex) - 1
    } else {
      numberOfDecimalDigits = 0
    }
    
    let currencySymbol = "$" /// NSLocale.currentLocale objectForKey:NSLocaleCurrencySymbol
    if newText.hasPrefix(currencySymbol) {
      return false
    }
    
    return isNumeric && numberOfDots <= 1 && numberOfDecimalDigits <= 2
  }

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

  /// Show Decimal Number if smaller font
  func changeToCurrencyLabel() {
    for subview in subviews {
      if let label = subview as? UILabel {
        label.attributedText = label.attributedStringForDecimalCurrency()
      }
    }
  }

  func autoSize() {
    for subview in subviews {
      if let label = subview as? UILabel {
        label.minimumScaleFactor = 0.3
        label.adjustsFontSizeToFitWidth = true
      }
    }
  }

  func setIcon(_ image: UIImage) {
    let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
    iconView.image = image
    let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
  }

}

class AutoSizeTextField: UITextField {

  override func layoutSubviews() {
    super.layoutSubviews()

    for subview in subviews {
      if let label = subview as? UILabel {
        label.minimumScaleFactor = 0.3
        label.adjustsFontSizeToFitWidth = true
      }
    }
  }

  /*
  /// https://stackoverflow.com/a/10087220/1294448
  - (CGRect)textRectForBounds:(CGRect)bounds {
  return CGRectInset( bounds , 8 , 8 );
  }
  
  - (CGRect)editingRectForBounds:(CGRect)bounds {
  return CGRectInset( bounds , 8 , 5 );
  }
   */

}

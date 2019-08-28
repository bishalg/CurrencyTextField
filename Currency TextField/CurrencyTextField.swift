//
//  CurrencyTextField.swift
//  Currency TextField
//
//  Created by Bishal Ghimire on 8/23/19.
//  Copyright © 2019 Big B Soft. All rights reserved.
//
/// https://github.com/richa008/CurrencyTextField/blob/master/CurrencyTextField/CurrencyTextField.swift

import UIKit

@IBDesignable
open class CurrencyTextField: UITextField {

  fileprivate let currencyFormattor = NumberFormatter()
  fileprivate var previousValue : String = ""
  
  // MARK: - init functions
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    initTextField()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initTextField()
  }
  
  func initTextField(){
    self.keyboardType = UIKeyboardType.decimalPad
    currencyFormattor.numberStyle = .currency
    currencyFormattor.minimumFractionDigits = 2
    currencyFormattor.maximumFractionDigits = 2
    // setAmount(defaultValue)
  }
  
}

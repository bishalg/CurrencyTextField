//
//  ViewController.swift
//  Currency TextField
//
//  Created by Bishal Ghimire on 8/23/19.
//  Copyright © 2019 Big B Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var textFieldWidthConstraint: NSLayoutConstraint!

  @IBOutlet var currencyTextField: UITextField! {
    didSet {
      currencyTextField.delegate = self
      currencyTextField.keyboardType = .decimalPad
      currencyTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
  }
  @IBOutlet var currencyView: CurrencyNumberView!
  
  @IBAction func buttonAction(_ sender: UIButton) {
    currencyTextField.resignFirstResponder()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    currencyTextField.becomeFirstResponder()
  }

}

extension ViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  /// This is called as soon as user types
  /// Text Field will only be updated if the valid condition is meet
  /// eg 'isCurrency' allows only double number after decimal
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard textField == currencyTextField else { return true }
    return currencyTextField.isCurrency(textField, shouldChangeCharactersIn: range, replacementString: string)
  }
  
  @objc func textFieldDidChange(_ textField: UITextField) {
    checkText(textField)
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    checkText(textField)
  }
  
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    checkText(textField)
  }
  
  func checkText(_ textField: UITextField) {
    textField.layoutIfNeeded()
    guard textField == currencyTextField else { return }
    let textCount = currencyTextField.text?.count ?? 0
    if textCount == 0 {
      emptyText()
    } else {
      textEntered()
    }
  }
  
  func textEntered() {
    guard let text = currencyTextField.text else { return }
    adjustWidthForText(text)
    currencyTextField.textAlignment = .center
    // currencySymbolLabel.textColor = .black
    
    if let attributedText = currencyTextField.attributedText {
      currencyTextField.attributedText = attributedText.currecyDecimalAttributedString()
      // attributedText.attributedStringForDecimalCurrency()
        // attributedText.decimalAttributedString()
    }
    currencyView.valueString = currencyTextField.text!
  }
  
  func emptyText() {
    let placeHolderText = String(format: "$%.2f", 45.23)
    guard let _ = currencyTextField.placeholder else { return }
    currencyTextField.placeholder = placeHolderText

    adjustWidthForText(placeHolderText)

    let placeHolderAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.TextColor.placeHolderGray,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 100)
    ]
    currencyTextField.attributedPlaceholder = NSAttributedString(string: placeHolderText,
                                                              attributes: placeHolderAttributes)
    currencyTextField.attributedPlaceholder = currencyTextField.attributedPlaceholder!.decimalAttributedString(textColor: UIColor.TextColor.placeHolderGray)
    currencyTextField.textAlignment = .center
  }
  
  func adjustWidthForText(_ text: String) {
    let textCount = text.count
    let decimalCount = CGFloat(text.decimalCountForText(text))
    if decimalCount > 0 {
      let count: CGFloat = CGFloat(CGFloat(textCount) - decimalCount) * 1.0
      let constant: CGFloat = CGFloat(55.0 + 60.0 * count + 25.0 * decimalCount)
      textFieldWidthConstraint.constant = constant
    } else {
      textFieldWidthConstraint.constant = CGFloat(55.0 + 60.0 * CGFloat(textCount))
    }
  }
  
}



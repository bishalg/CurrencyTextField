//
//  CurrencyNumberView.swift
//
//  Created by Bishal Ghimire on 8/13/19.
//  Copyright © 2019 Bishal Ghimire. All rights reserved.
//

import UIKit

@IBDesignable
class CurrencyNumberView: UIView {
  
  // MARK: - IBInspectable
  
  @IBInspectable
  public var valueString: String = "" {
    didSet {
      titleLabel.text = currencySymbol + valueString
      titleLabel.attributedText = titleLabel.attributedStringForDecimalCurrency()
      updateFrames()
    }
  }
  
  @IBInspectable
  public var valueFloat: Float = 0 {
    didSet {
      let formatter = NumberFormatter()
      formatter.numberStyle = .decimal
      if let formattedString = formatter.string(from: NSNumber(value: valueFloat)) {
        titleLabel.text = currencySymbol + formattedString
      }
      titleLabel.attributedText = titleLabel.attributedStringForDecimalCurrency()
      updateFrames()
    }
  }
  
  @IBInspectable
  public var currencySymbol: String = "$" {
    didSet {
      updateFrames()
    }
  }
  
  @IBInspectable
  public var textColor: UIColor = UIColor.TextColor.title {
    didSet {
      updateFrames()
    }
  }
  
  // MARK: - Convienience Init
  
  convenience init(stringValue: String) {
    self.init(frame: CGRect.zero)
    self.valueString = stringValue
  }

  convenience init(floatValue: Float) {
    self.init(frame: CGRect.zero)
    self.valueFloat = floatValue
  }

  convenience init(floatValue: Float, symbol: String = "$") {
    self.init(frame: CGRect.zero)
    self.valueFloat = floatValue
    self.currencySymbol = symbol
  }
  
  // MARK: - Override Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  override var frame: CGRect {
    didSet {
      updateFrames()
    }
  }
  
  // initWithCode to init view from xib or storyboard
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setupView()
  }
  
  override func updateConstraints() {
    super.updateConstraints()
    updateFrames()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    updateFrames()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = .clear
  }
  
  override func layoutIfNeeded() {
    super.layoutIfNeeded()
    updateFrames()
  }
  
  // MARK: - Setup And Update SubView
  
  private var titleLabel = UILabel(frame: CGRect.zero)
  
  func setupView() {
    titleLabel.frame = bounds
    titleLabel.font = UIFont.systemFont(ofSize: 70)
    titleLabel.textColor = textColor
    titleLabel.textAlignment = .center
    titleLabel.minimumScaleFactor = 0.4
    addSubview(titleLabel)
  }
  
  func updateFrames() {
    titleLabel.frame = bounds
    titleLabel.textColor = textColor
  }
  
}

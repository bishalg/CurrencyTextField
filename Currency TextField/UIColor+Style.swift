//
//  UIColor+Style.swift
//
//  Created by Bishal Ghimire on 5/24/19.
//  Copyright © 2019 Bishal Ghimire. All rights reserved.
//
/// https://stablekernel.com/how-to-keep-your-style-code-clean-in-swift/

import UIKit

extension UIColor {

  static var myAppGreen: UIColor {
    return UIColor(red: 0.12, green: 0.78, blue: 0.63, alpha: 1.0)
  }

  static var fbBlue_Light: UIColor {
    return UIColor(red: 66.0/255.0, green: 103.0/255.0, blue: 178.0/255.0, alpha: 1.0)
  }

  static var fbBlue: UIColor {
    return UIColor(red: 68.0/255.0, green: 95.0/255.0, blue: 160.0/255.0, alpha: 1.0)
  }

  static var offWhite: UIColor {
    return #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1) // HEX - F9F9F9 UIColor(r: 249, g: 249, b: 249)
  }

  static var cellTextTitleColor: UIColor {
    return UIColor(red: 0.19, green: 0.2, blue: 0.24, alpha: 0.87)
  }

  static var cellTextSubTitleColor: UIColor {
    return UIColor(red: 0.19, green: 0.2, blue: 0.24, alpha: 0.54)
  }

  static var mainTextTitleColor: UIColor {
    return UIColor(red: 0.21, green: 0.22, blue: 0.35, alpha: 1)
  }

  static var placeHolderColor: UIColor {
    return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
  }

  struct TextColor {
    static var title: UIColor {
      return #colorLiteral(red: 0.2117647059, green: 0.2235294118, blue: 0.3490196078, alpha: 1) // UIColor(r: 54, g: 57, b: 89) - 363959
    }
    static var subTitle: UIColor {
      return #colorLiteral(red: 0.4470588235, green: 0.4549019608, blue: 0.5411764706, alpha: 1) // UIColor(r: 114, g: 116, b: 138) - 72748A
    }
    static var darkTextBlack: UIColor {
      return #colorLiteral(red: 0.2196078431, green: 0.2196078431, blue: 0.2392156863, alpha: 1) // 38383D
    }
    static var darkTextGray: UIColor {
      return #colorLiteral(red: 0.2196078431, green: 0.2196078431, blue: 0.2392156863, alpha: 0.5)  // 38383D - 50% = AEAEB0
    }
    static var white: UIColor {
      return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // UIColor(r: 255, g: 255, b: 255) - FFFFFF
    }
    static var gray: UIColor {
      return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) // CDCDCD
    }
    static var placeHolderGray: UIColor {
      return #colorLiteral(red: 0.8117647059, green: 0.8117647059, blue: 0.8156862745, alpha: 1) // CFCFD0
    }
    static var placeHolderGreen: UIColor {
      return #colorLiteral(red: 0.3215686275, green: 0.7803921569, blue: 0.6274509804, alpha: 1) // 1EC7A0
    }
  }

}

//
//  TextFieldWithPicker.swift
//  Converter
//
//  Created by Alexey Davletshin on 31.07.2020.
//  Copyright © 2020 Alexey Davletshin. All rights reserved.
//

import UIKit

@IBDesignable
class ConverterView: UIView {
  override func prepareForInterfaceBuilder() {
    customizeView()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    customizeView()
  }
  
  func customizeView() {
    layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    layer.cornerRadius = 3.0
    layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    layer.borderWidth = 1.0
  }
}

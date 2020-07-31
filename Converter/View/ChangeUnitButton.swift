//
//  ChangeUnitButton.swift
//  Converter
//
//  Created by Alexey Davletshin on 31.07.2020.
//  Copyright © 2020 Alexey Davletshin. All rights reserved.
//

import UIKit

@IBDesignable
class ChangeUnitButton: UIButton {
  // incorrectly draws in landscape
  override func draw(_ rect: CGRect) {
    let imageView = UIImageView()
    let arrow = UIImage(systemName: "arrow.up.and.down")
    imageView.image = arrow
    imageView.frame = CGRect(origin: CGPoint(x: frame.width - 20.0, y: frame.height / 2.0 - 10.0),
                             size: arrow!.size)
    imageView.tintColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
    addSubview(imageView)
  }
}

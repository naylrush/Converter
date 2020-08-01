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
  let arrow = UIImage(systemName: "arrow.up.and.down")!
  var arrowIcon: UIImageView!
  
  override func prepareForInterfaceBuilder() {
    addArrowIcon()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    addArrowIcon()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    resizeArrowIcon()
  }
  
  func resizeArrowIcon() {
    arrowIcon.frame = CGRect(origin: CGPoint(x: frame.width - 20.0,
                                             y: frame.height / 2.0 - 10.0),
                             size: arrow.size)
  }
  
  func addArrowIcon() {
    arrowIcon = UIImageView()
    arrowIcon.image = arrow
    arrowIcon.sizeToFit()
    arrowIcon.tintColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
    addSubview(arrowIcon)
  }
  
  override func setTitle(_ title: String?, for state: UIControl.State) {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.firstLineHeadIndent = 5.0
    if let title = title {
      let attributedText = NSAttributedString(string: title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
      self.setAttributedTitle(attributedText, for: state)
    }
  }
}

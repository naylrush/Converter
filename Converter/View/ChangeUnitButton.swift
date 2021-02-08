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
  
  var side: Side!
  
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
    arrowIcon.frame = CGRect(origin: CGPoint(x: frame.width - arrow.size.width - 3.0, // arrow has about 2.0 point of blank space
                                             y: (frame.height - arrow.size.height) / 2),
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
      let attributedText = NSAttributedString(string: title,
                                              attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                           NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)])
      self.setAttributedTitle(attributedText, for: state)
    }
  }
}

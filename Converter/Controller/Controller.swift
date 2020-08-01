//
//  ViewController.swift
//  Converter
//
//  Created by Alexey Davletshin on 30.07.2020.
//  Copyright © 2020 Alexey Davletshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var converter = Converter(fromUnit: .mile, toUnit: .meter)
  
  @IBOutlet weak var leftTextField: UITextField!
  @IBOutlet weak var rightTextField: UITextField!
  
  func convertAndWriteNumber(stringNumber: String?, textField: UITextField, direct: Bool) {
    if let number = Double(stringNumber ?? "") {
      var value = number * (direct ? converter.multiplyer : 1.0 / converter.multiplyer)
      value = round(value * 100.0) / 100.0
      textField.text = value == Double(Int(value)) ? "\(Int(value))" : "\(value)"
    } else {
      textField.text = nil
    }
  }
  
  @IBAction func inLeftTextFieldTexted(_ sender: Any) {
    convertAndWriteNumber(stringNumber: leftTextField.text, textField: rightTextField, direct: true)
  }
  
  @IBAction func inRightTextFieldTexted(_ sender: Any) {
    convertAndWriteNumber(stringNumber: rightTextField.text, textField: leftTextField, direct: false)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

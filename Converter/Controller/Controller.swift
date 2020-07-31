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
  
  @IBAction func textedInLeftTextField(_ sender: Any) {
    if let number = Double(leftTextField.text ?? "") {
      rightTextField.text = String(format: "%.2f", number * converter.multiplyer)
    } else {
      rightTextField.text = nil
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    leftTextField.placeholder = "\(converter.fromUnit)".capitalized
    rightTextField.placeholder = "\(converter.toUnit)".capitalized
  }
}

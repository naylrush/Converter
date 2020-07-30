//
//  ViewController.swift
//  Converter
//
//  Created by Alexey Davletshin on 30.07.2020.
//  Copyright © 2020 Alexey Davletshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var LeftTextField: UITextField!
  @IBOutlet weak var RightTextField: UITextField!
  
  @IBAction func textedInLeftTextField(_ sender: Any) {
    let multiplier = distanceConvertingMultiplier(from: .mile, to: .meter)
    if let number = Double(LeftTextField.text ?? "") {
      RightTextField.text = String(format: "%.2f", number * multiplier)
    } else {
      RightTextField.text = nil
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
}

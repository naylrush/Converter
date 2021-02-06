//
//  ViewController.swift
//  Converter
//
//  Created by Alexey Davletshin on 30.07.2020.
//  Copyright © 2020 Alexey Davletshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  // ConverterViews
  var converter = Converter(fromUnit: .mile, toUnit: .meter)
  
  @IBOutlet weak var leftTextField: UITextField!
  @IBOutlet weak var rightTextField: UITextField!
  
  func convertAndWriteNumber(stringNumber: String?, textField: UITextField, direct: Bool) {
    if let number = Double(stringNumber ?? "") {
      var value = number * (direct ? converter.multiplyer : 1.0 / converter.multiplyer)
      value = Double(String(format: "%.2f", value))!
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
  
  @IBAction func touchedOnTextField(_ sender: Any) {
    deselectChangeUnitButtons()
  }
  
  // UnitPicker
  var units: [DistanceUnit]!
  var unitsNames: [String]!
  
  @IBOutlet weak var unitPicker: UIPickerView!
  
  @IBOutlet weak var leftChangeUnitButton: ChangeUnitButton!
  @IBOutlet weak var rightChangeUnitButton: ChangeUnitButton!
  
  var changeUnitButtons: [ChangeUnitButton]!

  var changeUnitButtonTouchedUp: Side!
  
  @IBAction func touchedUpLeftChangeUnitButton(_ sender: Any) {
    touchedChangeUnitButton(.left)
  }
  
  @IBAction func touchedUpRightChangeUnitButton(_ sender: Any) {
    touchedChangeUnitButton(.right)
  }
  
  func touchedChangeUnitButton(_ side: Side) {
    view.endEditing(true)
    unitPicker.isHidden = false
    changeUnitButtonTouchedUp = side
    
    var changeUnitButtons = self.changeUnitButtons!
    changeUnitButtons[side.rawValue].backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    changeUnitButtons.remove(at: side.rawValue)
    changeUnitButtons[0].backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return units.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return unitsNames[row]
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let button = changeUnitButtons[changeUnitButtonTouchedUp.rawValue]
    button.setTitle(unitsNames[row], for: .normal)

    switch button.side {
    case .left:
      converter = Converter(fromUnit: units[row], toUnit: converter.toUnit)
      inLeftTextFieldTexted("update")
    case .right:
      converter = Converter(fromUnit: converter.fromUnit, toUnit: units[row])
      inRightTextFieldTexted("update")
    default:
      abort()
    }
  }
  
  // Controller stuff
  override func viewDidLoad() {
    super.viewDidLoad()
    unitPicker.delegate = self
    unitPicker.dataSource = self
    
    units = metricUnits + imperialUnits
    unitsNames = units.map { "\($0)".capitalized }
    
    let hideAllTap = UITapGestureRecognizer(target: self, action: #selector(hideAll))
    view.addGestureRecognizer(hideAllTap)
    
    customizeKeyboard()
    
    leftChangeUnitButton.side = .left
    rightChangeUnitButton.side = .right
    
    changeUnitButtons = [leftChangeUnitButton, rightChangeUnitButton]
  }
  
  func customizeKeyboard() {
    let toolBar = UIToolbar(frame: CGRect(origin: CGPoint(x: 0, y: 0),
                                          size: CGSize(width: view.frame.width, height: 40.0)))
    let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done,
                                     target: self, action: #selector(hideAll))
    toolBar.setItems([doneButton], animated: true)
    
    leftTextField.inputAccessoryView = toolBar
    rightTextField.inputAccessoryView = toolBar
  }
  
  func deselectChangeUnitButtons() {
    leftChangeUnitButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    rightChangeUnitButton.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
  }
  
  @objc func hideAll() {
    view.endEditing(true)
    unitPicker.isHidden = true
    deselectChangeUnitButtons()
  }
}

//
//  ViewController.swift
//  Converter
//
//  Created by Alexey Davletshin on 30.07.2020.
//  Copyright © 2020 Alexey Davletshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  // Converter
  var converter = Converter(fromUnit: .mile, toUnit: .meter)
  
  func convertAndWriteNumber(stringNumber: String?, textField: UITextField, direct: Bool) {
    if let number = Double(stringNumber ?? "") {
      var value = number * (direct ? converter.multiplier : 1.0 / converter.multiplier)
      value = Double(String(format: "%.2f", value))!
      textField.text = value == Double(Int(value)) ? "\(Int(value))" : "\(value)"
    } else {
      textField.text = nil
    }
  }
  
  // TextFields
  @IBOutlet weak var leftTextField: UITextField!
  @IBOutlet weak var rightTextField: UITextField!
  
  @IBAction func textInLeftField(_ sender: Any) {
    convertAndWriteNumber(stringNumber: leftTextField.text, textField: rightTextField, direct: true)
  }
  
  @IBAction func textInRightField(_ sender: Any) {
    convertAndWriteNumber(stringNumber: rightTextField.text, textField: leftTextField, direct: false)
  }
  
  @IBAction func touchedOnTextField(_ sender: Any) {
    deselectChangeUnitButtons()
  }
  
  // UnitPicker & Buttons
  var units: [DistanceUnit]!
  var unitsNames: [String]!
  
  @IBOutlet weak var unitPicker: UIPickerView!
  
  @IBOutlet weak var leftChangeUnitButton: ChangeUnitButton!
  @IBOutlet weak var rightChangeUnitButton: ChangeUnitButton!

  var activeChangeUnitButton: ChangeUnitButton!
  
  @IBAction func touchedUpLeftChangeUnitButton(_ sender: Any) {
    activeChangeUnitButton = leftChangeUnitButton
    changeUnitButtonWasTouchedUp()
  }
  
  @IBAction func touchedUpRightChangeUnitButton(_ sender: Any) {
    activeChangeUnitButton = rightChangeUnitButton
    changeUnitButtonWasTouchedUp()
  }
  
  func changeUnitButtonWasTouchedUp() {
    view.endEditing(true)
    unitPicker.isHidden = false
    
    // select button's current unit
    if let buttonUnitName = activeChangeUnitButton.titleLabel?.text {
      if let row = unitsNames.firstIndex(of: buttonUnitName) {
        unitPicker.selectRow(row, inComponent: 0, animated: true)
      }
    }
    
    activeChangeUnitButton.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
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
    activeChangeUnitButton.setTitle(unitsNames[row], for: .normal)

    // update unit and reconvert values
    switch activeChangeUnitButton.side {
    case .left:
      converter = Converter(fromUnit: units[row], toUnit: converter.toUnit)
      textInLeftField("update")
    case .right:
      converter = Converter(fromUnit: converter.fromUnit, toUnit: units[row])
      textInRightField("update")
    default:
      abort()
    }
  }
  
  // ExhangeButton
  @IBAction func exchangeUnits(_ sender: Any) {
    guard let leftButtonUnit = leftChangeUnitButton.titleLabel?.text else { return }
    guard let rightButtonUnit = rightChangeUnitButton.titleLabel?.text else { return }
    
    leftChangeUnitButton.setTitle(rightButtonUnit, for: .normal)
    rightChangeUnitButton.setTitle(leftButtonUnit, for: .normal)
    
    // Just update any button
    converter = Converter(fromUnit: converter.toUnit, toUnit: converter.fromUnit)
    textInLeftField("update")
  }
  
  
  // Controller stuff
  override func viewDidLoad() {
    super.viewDidLoad()
    
    unitPicker.delegate = self
    unitPicker.dataSource = self
    
    units = metricUnits + imperialUnits
    unitsNames = units.map { "\($0)".capitalized }
    
    leftChangeUnitButton.side = .left
    rightChangeUnitButton.side = .right
    
    let hideAllTap = UITapGestureRecognizer(target: self, action: #selector(hideAll))
    view.addGestureRecognizer(hideAllTap)
    
    customizeKeyboard()
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

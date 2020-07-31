//
//  Converter.swift
//  Converter
//
//  Created by Alexey Davletshin on 31.07.2020.
//  Copyright © 2020 Alexey Davletshin. All rights reserved.
//

import Foundation

class Converter {
  public private(set) var fromUnit: DistanceUnit
  public private(set) var toUnit: DistanceUnit
  
  var multiplyer: Double {
    get {
      return distanceConvertingMultiplier(from: fromUnit, to: toUnit)
    }
  }
  
  init(fromUnit: DistanceUnit, toUnit: DistanceUnit) {
    self.fromUnit = fromUnit
    self.toUnit = toUnit
  }
}

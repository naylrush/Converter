//
//  DistanceUnit.swift
//  Converter
//
//  Created by Alexey Davletshin on 30.07.2020.
//  Copyright © 2020 Alexey Davletshin. All rights reserved.
//

import Foundation

enum DistanceUnit: Int {
  // Metric system
  case centimeter
  case meter
  case kilometer
  // Imperial system
  case inch
  case feet
  case yard
  case mile
}

let metricUnits: [DistanceUnit] = [.centimeter, .meter, .kilometer]
let imperialUnits: [DistanceUnit] = [.inch, .feet, .yard, .mile]

func distanceConvertingMultiplier(from fromUnit: DistanceUnit, to toUnit: DistanceUnit) -> Double {
  if metricUnits.contains(fromUnit) == metricUnits.contains(toUnit) {
    let convertDown: [DistanceUnit: Double] = metricUnits.contains(fromUnit) ?
      [.meter: 100.0, .kilometer: 1000.0] : [.feet: 12.0, .yard: 3.0, .mile: 1760.0]
    
    var multiplier = 1.0
    
    if fromUnit.rawValue < toUnit.rawValue {
      for rawValue in (fromUnit.rawValue + 1)...toUnit.rawValue {
        multiplier *= convertDown[DistanceUnit(rawValue: rawValue)!]!
      }
      multiplier = 1.0 / multiplier
    } else if fromUnit.rawValue > toUnit.rawValue {
      for rawValue in (toUnit.rawValue + 1)...fromUnit.rawValue {
        multiplier *= convertDown[DistanceUnit(rawValue: rawValue)!]!
      }
    }
    return multiplier
  }
  
  let metersInMile = 1609.344
  
  if metricUnits.contains(fromUnit) {
    return distanceConvertingMultiplier(from: fromUnit, to: .meter) / metersInMile *
      distanceConvertingMultiplier(from: .mile, to: toUnit)
  } else {
    return distanceConvertingMultiplier(from: fromUnit, to: .mile) * metersInMile *
      distanceConvertingMultiplier(from: .meter, to: toUnit)
  }
}

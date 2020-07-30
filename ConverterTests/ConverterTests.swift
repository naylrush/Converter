//
//  ConverterTests.swift
//  ConverterTests
//
//  Created by Alexey Davletshin on 30.07.2020.
//  Copyright © 2020 Alexey Davletshin. All rights reserved.
//

import XCTest

class ConverterTests: XCTestCase {
  override func setUpWithError() throws {
      // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testMetricSystemConverter() {
    // from one to the same
    XCTAssertEqual(distanceConvertingMultiplier(from: .centimeter, to: .centimeter), 1.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .meter, to: .meter), 1.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .kilometer, to: .kilometer), 1.0, accuracy: 0.5)
    // from bigger to smaller
    XCTAssertEqual(distanceConvertingMultiplier(from: .meter, to: .centimeter), 100.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .kilometer, to: .meter), 1000.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .kilometer, to: .centimeter), 100000.0, accuracy: 0.5)
    // from smaller to bigger
    XCTAssertEqual(distanceConvertingMultiplier(from: .centimeter, to: .meter), 1.0 / 100.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .meter, to: .kilometer), 1.0 / 1000.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .centimeter, to: .kilometer), 1.0 / 100000.0, accuracy: 0.5)
  }

  func testImperialSystemConverter() {
    // from one to same
    XCTAssertEqual(distanceConvertingMultiplier(from: .inch, to: .inch), 1.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .feet, to: .feet), 1.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .yard, to: .yard), 1.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .mile, to: .mile), 1.0, accuracy: 0.5)
    // from bigger to smaller
    XCTAssertEqual(distanceConvertingMultiplier(from: .feet, to: .inch), 12.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .yard, to: .feet), 3.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .mile, to: .yard), 1760.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .yard, to: .inch), 36.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .mile, to: .feet), 5280.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .mile, to: .inch), 63360.0, accuracy: 0.5)
    // from smaller to bigger
    XCTAssertEqual(distanceConvertingMultiplier(from: .inch, to: .feet), 1.0 / 12.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .feet, to: .yard), 1.0 / 3.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .yard, to: .mile), 1.0 / 1760.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .inch, to: .yard), 1.0 / 36.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .feet, to: .mile), 1.0 / 5280.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .inch, to: .mile), 1.0 / 63360.0, accuracy: 0.5)
  }
  
  func testMeterImperalConverter() {
    XCTAssertEqual(distanceConvertingMultiplier(from: .mile, to: .meter), 1609.344, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .meter, to: .mile), 1.0 / 1609.344, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .inch, to: .centimeter), 2.54, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .yard, to: .centimeter), 91.44, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .meter, to: .inch), 39.37, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .kilometer, to: .yard), 1093.61, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .mile, to: .centimeter), 160934.0, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .feet, to: .centimeter), 30.48, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .centimeter, to: .yard), 0.011, accuracy: 0.5)
    XCTAssertEqual(distanceConvertingMultiplier(from: .centimeter, to: .feet), 0.033, accuracy: 0.5)
  }

  func testPerformanceExample() throws {
      // This is an example of a performance test case.
      measure {
          // Put the code you want to measure the time of here.
      }
  }
}

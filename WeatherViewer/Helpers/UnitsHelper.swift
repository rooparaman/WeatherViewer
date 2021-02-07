// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation

struct UnitsHelper {
  static func formatTemp(value:Double) -> String{
    return String(format: "%.2f", value) + Constants.unit.temperature.rawValue
  }
  static func formatPressure(value:Int) -> String {
    return String(value) + Constants.unit.pressure.rawValue
  }
  static func formatHumidity(value:Int) -> String {
    return String(value) + Constants.unit.humidity.rawValue
  }
}

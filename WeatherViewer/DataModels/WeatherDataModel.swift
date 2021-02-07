// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation
struct WeatherDataModel: Codable {
  let name: String
  let id: Int
  let main: Main
  let weather: [WeatherData]
}

struct Main: Codable {
  let temp: Double
  let feels_like: Double
  let temp_min: Double
  let temp_max: Double
  let pressure: Int
  let humidity: Int
}

struct WeatherData: Codable {
  let description: String
}

// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation

class WeatherViewModel {
  var cities: Box<[CityModel]> = Box([])
  
  func getDefaultCities() {
    self.cities.value = [
      CityModel(id: 2147714, name: "Melbourne", lattitude: nil, longitude: nil),
      CityModel(id: 2174003, name: "Brisbane", lattitude: nil, longitude: nil),
      CityModel(id: 4163971, name: "Sydney", lattitude: nil, longitude: nil)
    ]
  }
}

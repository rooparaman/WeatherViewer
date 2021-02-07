// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation

class WeatherViewModel {
  var cities: [CityModel] = []
  
  init() {
    self.cities = [
      CityModel(id: 4163971, name: "Sydney"),
      CityModel(id: 2147714, name: "Melbourne"),
      CityModel(id: 2174003, name: "Brisbane")
    ]
  }
}

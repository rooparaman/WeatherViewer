// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation

class CityWeatherViewModel {
  var cityName: String
  var cityId: Int
  let temperature = Box("")
  let service: WeatherService = WeatherService()
  
  init(name: String, id: Int) {
    self.cityName = name
    self.cityId = id
  }
  
  func fetchWeather(cityId: Int){
    service.getCurrentWeather(for: cityId) { (weather) in
      self.temperature.value = String(format: "%.2f", weather.temperature)
    } failureCompletion: { (error) in
      self.temperature.value = "N/A"
    }
  }
}

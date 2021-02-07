// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation
import CoreLocation

class CityWeatherViewModel {
  var cityName = Box("")
  var cityId: Int
  let temperature = Box("")
  let service: WeatherService = WeatherService()
  
  init(name: String, id: Int) {
    self.cityName.value = name
    self.cityId = id
  }
  
  func fetchWeather(cityId: Int, lat: Double, lng: Double){
    if cityId == Constants.currentLocationId {
      service.getWeatherWithCoordinates(latitude: lat, longitude: lng) { (weather) in
        self.cityName.value = weather.location
        self.temperature.value = String(format: "%.2f", weather.temperature)
      } failureCompletion: { (error) in
        self.temperature.value = "N/A"
      }
    }else{
      service.getWeatherWithCityId(for: cityId) { (weather) in
        self.temperature.value = String(format: "%.2f", weather.temperature)
      } failureCompletion: { (error) in
        self.temperature.value = "N/A"
      }
    }
    
    
  }
}

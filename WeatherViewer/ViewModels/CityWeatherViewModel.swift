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
  let lat: Double
  let lng: Double
  
  init(name: String, id: Int, lat: Double, lng:Double) {
    self.cityId = id
    self.lat = lat
    self.lng = lng
  }
  
  private func setValues(weather:WeatherModel){
    self.cityName.value = weather.location
    self.temperature.value = UnitsHelper.formatTemp(value: weather.temperature)
  }
  
  private func setError(){
    self.temperature.value = Constants.defaultMetricValue
  }
  
  func fetchWeather(cityId: Int, lat: Double, lng: Double){
    if cityId == Constants.currentLocationId {
      service.getWeatherWithCoordinates(latitude: lat, longitude: lng) {[weak self] (weather) in
        self?.setValues(weather: weather)
      } failureCompletion: {[weak self] (error) in
        self?.setError()
      }
    }else{
      service.getWeatherWithCityId(for: cityId) {[weak self] (weather) in
        self?.setValues(weather: weather)
      } failureCompletion: {[weak self] (error) in
        self?.setError()
      }
    }
    
    
  }
}

// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation

class WeatherDetailViewModel {
  var cityName = Box("")
  var cityId = 0
  var lat = 0.0
  var lng = 0.0
  let service: WeatherService = WeatherService()
  let propertyArray = Constants.propertyArray
  var valueArray: Box<[String]> = Box([])
  
  init(city:CityModel) {
    self.cityId = city.id
    self.lat = city.lattitude ?? 0
    self.lng = city.longitude ?? 0
    
  }
  private func setValues(weather:WeatherModel){
    self.cityName.value = weather.location
    self.valueArray.value = [
      UnitsHelper.formatTemp(value: weather.temperature),
      UnitsHelper.formatTemp(value: weather.temperatureFeel),
      weather.description,
      UnitsHelper.formatTemp(value: weather.temperatureMin),
      UnitsHelper.formatTemp(value: weather.temperatureMax),
      UnitsHelper.formatPressure(value: weather.pressure),
      UnitsHelper.formatHumidity(value: weather.humidity)
    ]
  }
  
  
  private func setError(){
    self.valueArray.value = []
  }
  func fetchWeatherDeatil(for cityId:Int, lat: Double, lng: Double){
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

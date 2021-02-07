// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation
import CoreLocation
struct WeatherService {
  
  private let apiService = APIService()
  private let dataMapper = WeatherDataMapper()
  
  
  func getWeatherWithCoordinates(latitude: CLLocationDegrees, longitude: CLLocationDegrees, successCompletion: @escaping(WeatherModel)-> (), failureCompletion: @escaping(CustomError)-> ()) {
    let urlString = "\(Constants.currentWeatherUrl)&lat=\(latitude)&lon=\(longitude)"
    getWeather(with: urlString) { (weather) in
      successCompletion(weather)
    } failureCompletion: { (error) in
      failureCompletion(error)
    }
  }
  
  //Service function to get the current weather details
  func getWeatherWithCityId(for cityId: Int, successCompletion: @escaping(WeatherModel)-> (), failureCompletion: @escaping(CustomError)-> ()){
    let urlString = "\(Constants.currentWeatherUrl)&id=\(cityId)"
    getWeather(with: urlString) { (weather) in
      successCompletion(weather)
    } failureCompletion: { (error) in
      failureCompletion(error)
    }
    
  }
  
  private func getWeather(with url: String, successCompletion: @escaping(WeatherModel)-> (), failureCompletion: @escaping(CustomError)-> ()){
    apiService.get(with: url) { (result) in
      switch result {
      case .failure(let error):
        failureCompletion(error)
      case .success(let data):
        if let info = dataMapper.parseJson(weatherData: data) {
          successCompletion(info)
        }else {
          failureCompletion(CustomError.mappingError)
        }
      }
    }
  }
  
}

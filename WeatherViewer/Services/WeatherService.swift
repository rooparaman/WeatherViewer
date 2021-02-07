// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation
struct WeatherService {
  
  private let apiService = APIService()
  private let dataMapper = WeatherDataMapper()
  
  //Service function to get the current weather details
  func getCurrentWeather(successCompletion: @escaping(WeatherModel)-> (), failureCompletion: @escaping(CustomError)-> ()){
    //TODO:need to get api key
    apiService.get(with: Constants.currentWeatherUrl) { (result) in
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

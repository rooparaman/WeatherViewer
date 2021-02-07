// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

//The data Mapper to map the api json response to the Business model

import Foundation

struct WeatherDataMapper {
  func parseJson(weatherData:Data) -> WeatherModel? {
    let decoder = JSONDecoder.init()
    do {
      
      let decodedData = try decoder.decode(WeatherDataModel.self, from: weatherData)
      let weather = WeatherModel(location: decodedData.name,
                                 id: decodedData.id,
                                 description: decodedData.weather.first?.description ?? "",
                                 temperature: decodedData.main.temp,
                                 temperatureFeel: decodedData.main.feels_like,
                                 temperatureMin: decodedData.main.temp_min,
                                 temperatureMax: decodedData.main.temp_max,
                                 pressure: decodedData.main.pressure,
                                 humidity: decodedData.main.humidity)
      
      return weather
    } catch {
      print(error)
      return nil
    }
  }
}

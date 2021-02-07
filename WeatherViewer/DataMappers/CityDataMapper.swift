// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation

struct CityDataMapper {
  func parseJson(cityData:Data) -> [CityModel]? {
    let decoder = JSONDecoder.init()
    do {
      
      let decodedData = try decoder.decode([CityDataModel].self, from: cityData)
      var cities: [CityModel] = []
     
      for data in decodedData {
        cities.append(CityModel(id: data.id, name: data.name, lattitude: nil, longitude: nil))
      }
      
      return cities
      
    } catch {
      print(error)
      return nil
    }
  }
}

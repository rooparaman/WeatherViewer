// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation

class CitiesViewModel {
  var cities: Box<[CityModel]> = Box([CityModel(id: 0000, name: "My Location")])
  let dataMapper = CityDataMapper()
  
  func getCities(){
    let url = Bundle.main.url(forResource: "Cities", withExtension: "json")!
    do {
      let data = try Data(contentsOf: url)
      if let cities = dataMapper.parseJson(cityData: data){
        for city in cities {
          self.cities.value.append(city)
        }
        
      }
    }catch {
      self.cities.value = []
    }
    
  }
}

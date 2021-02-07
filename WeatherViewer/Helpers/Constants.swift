// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation
struct Constants {
  static let currentWeatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=bb82e16ff45bd0461a35733a42a41b9c&units=metric"
  static let openWeatherApiKey = "bb82e16ff45bd0461a35733a42a41b9c"
  static let currentLocationId = -1
  static let defaultMetricValue = "N/A"
  static let weatherDetailCellIdentifier = "weatherDetailCell"
  static let detailSegueIdentifier = "goToDetailSegue"
  
  enum unit : String {
    case temperature = " C"
    case pressure = " hPa"
    case humidity = " %"
  }
  
  enum error : String {
    case dataMappingError = "Data is corrupt. Please contact admin"
    case networkError = "Network error has occured. Please check your connection  and try again"
    case unknownError = "Unknown Error has occured. Please try after sometime"
    case unauthorizedError = "Unauthorized"
    case accessError = "You do not have the access rights. Contact admin"
    case serverError = "An unexpected server error occurred."
  }
}

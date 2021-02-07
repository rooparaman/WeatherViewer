// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation
struct Constants {
  static let currentWeatherUrl = ""
  enum error : String {
    case dataMappingError = "Data is corrupt. Please contact admin"
    case networkError = "Network error has occured. Please check your connection  and try again"
    case unknownError = "Unknown Error has occured. Please try after sometime"
    case unauthorizedError = "Unauthorized"
    case accessError = "You do not have the access rights. Contact admin"
    case serverError = "An unexpected server error occurred."
  }
}

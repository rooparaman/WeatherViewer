// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import Foundation
enum CustomError: Error {
  //Throw in service transport error
  case transportError(error: Error)
  
  // Throw in all other server errors
  case serverSideError(code: Int)
  
  //Throw in json mapping error
  case mappingError
  
  //All other cases
  case unknowError
}

// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import XCTest
@testable import WeatherViewer

class WeatherViewerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
  
    func testCityWeatherViewModel() throws {
      var cityName = ""
      let viewModel = CityWeatherViewModel(name: "Singapore", id: 9000, lat: 0.0, lng: 0.0)
      viewModel.cityName.bind { (name) in
        cityName = name
      }
      XCTAssertEqual(cityName, "Singapore")
    }

}

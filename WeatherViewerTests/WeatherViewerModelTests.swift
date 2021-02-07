// Created by Roopa Raman on 8/2/21
// 
// Using Swift 5.0

import XCTest
@testable import WeatherViewer

class WeatherViewerModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func testModel() throws {
    let weather = WeatherModel(location: "Sydney", id: 123, description: "sunny", temperature: 29.0, temperatureFeel: 31, temperatureMin: 19, temperatureMax: 33, pressure: 1100, humidity: 95)
    XCTAssertEqual(weather.location, "Sydney")
    XCTAssertEqual(weather.temperatureMin, 19)
    XCTAssertEqual(weather.temperatureMax, 33)
    XCTAssertEqual(weather.temperatureFeel, 31)
    XCTAssertEqual(weather.humidity, 95)
  }

}

// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import XCTest
@testable import WeatherViewer

class WeatherDataMapperTests: XCTestCase {
    private var dataMapper = WeatherDataMapper()
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  //Test Data mapper with sample data
  func testDataMapper() throws {
    
    let bundle = Bundle(for: type(of: self))
    guard let bundlePath = bundle.url(forResource: "mockData", withExtension: "json") else {
      XCTFail("Missing file: mockData.json")
      return
    }
    do{
      let jsonData = try Data(contentsOf: bundlePath)
      let weather = dataMapper.parseJson(weatherData: jsonData)
        
      XCTAssertEqual(weather?.location, "Mountain View")
      XCTAssertEqual(weather?.description, "clear sky")
      XCTAssertEqual(weather?.temperature, 282.55)
      XCTAssertEqual(weather?.temperatureMin, 280.37)
      XCTAssertEqual(weather?.temperatureMax, 284.26)
      XCTAssertEqual(weather?.temperatureFeel, 281.86)
      XCTAssertEqual(weather?.pressure, 1023)
      XCTAssertEqual(weather?.humidity, 100)
      XCTAssertEqual(weather?.id, 420006353)
      
    }catch {
      XCTFail("Could not parse")
    }
  }

}

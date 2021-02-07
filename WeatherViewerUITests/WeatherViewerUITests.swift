// Created by Roopa Raman on 7/2/21
// 
// Using Swift 5.0

import XCTest

class WeatherViewerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func testHomePage() throws {
    // UI tests must launch the application that they test.
    
    let app = XCUIApplication()
    app.launch()
    let tablesQuery = app.tables
    let tableCell = tablesQuery.cells.firstMatch
    let exists = NSPredicate(format: "exists == true")
    expectation(for: exists, evaluatedWith: tableCell, handler: nil)
    waitForExpectations(timeout: 5, handler: nil)
    
    XCTAssertTrue(tablesQuery.cells.firstMatch.staticTexts["tempLabel"].exists)
    XCTAssertTrue(tablesQuery.cells.firstMatch.staticTexts["cityLabel"].exists)
    app.navigationBars["Weather Viewer"].buttons["add"].tap()
    app.tables/*@START_MENU_TOKEN@*/.staticTexts["Brewster"]/*[[".cells.staticTexts[\"Brewster\"]",".staticTexts[\"Brewster\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
    app.tables.cells.firstMatch.staticTexts["tempLabel"].tap()
    XCTAssertTrue(tablesQuery.cells.firstMatch.staticTexts["propLabel"].exists)
    XCTAssertTrue(tablesQuery.cells.firstMatch.staticTexts["valueLabel"].exists)
    
    app.navigationBars["Sydney"].buttons["Weather Viewer"].tap()
    sleep(1)
      
  }
}

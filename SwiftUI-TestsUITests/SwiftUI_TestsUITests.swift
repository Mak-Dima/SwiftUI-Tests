//
//  SwiftUI_TestsUITests.swift
//  SwiftUI-TestsUITests
//
//  Created by Dmytro Maksiutenko on 2026-01-12.
//

import XCTest


final class SwiftUI_TestsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testAppFlow() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let loadButton = app.buttons["id_LoadButton"]
        loadButton.tap()
        
        let dataList = app.collectionViews["id_DataList"]
        XCTAssert(dataList.waitForExistence(timeout: 3), "List does not exists.")
        XCTAssert(dataList.staticTexts.count > 0, "Text fields does not match.")

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}

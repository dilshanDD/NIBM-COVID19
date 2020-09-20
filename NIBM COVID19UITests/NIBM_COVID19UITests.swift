//
//  NIBM_COVID19UITests.swift
//  NIBM COVID19UITests
//
//  Created by DilshanKumarasingheMac on 8/29/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import XCTest

class NIBM_COVID19UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testSafeActions()
    {
        
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.staticTexts["Safe Actions"]/*[[".buttons[\"Safe Actions\"].staticTexts[\"Safe Actions\"]",".staticTexts[\"Safe Actions\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let nextStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["NEXT"]/*[[".buttons[\"NEXT\"].staticTexts[\"NEXT\"]",".staticTexts[\"NEXT\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nextStaticText.tap()
        nextStaticText.tap()
        nextStaticText.tap()
        nextStaticText.tap()
        nextStaticText.tap()
        nextStaticText.tap()
        nextStaticText.tap()
        
        let prevStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["PREV"]/*[[".buttons[\"PREV\"].staticTexts[\"PREV\"]",".staticTexts[\"PREV\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        prevStaticText.tap()
        prevStaticText.tap()
        prevStaticText.tap()
        prevStaticText.tap()
        prevStaticText.tap()
        prevStaticText.tap()
        prevStaticText.tap()
        prevStaticText.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Home"]/*[[".buttons[\"Home\"].staticTexts[\"Home\"]",".staticTexts[\"Home\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
  }
    func testTemp()
     {
        
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.staticTexts["Update"]/*[[".buttons[\"Update\"].staticTexts[\"Update\"]",".staticTexts[\"Update\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Enter temparature"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["update "]/*[[".buttons[\"update \"].staticTexts[\"update \"]",".staticTexts[\"update \"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Information"].scrollViews.otherElements.buttons["OK"].tap()
       
    
    
    }
    func testSurvey()
    {
        
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.staticTexts["Setting"]/*[[".buttons[\"Setting\"].staticTexts[\"Setting\"]",".staticTexts[\"Setting\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["NIBM_COVID19.settingView"].buttons["Back"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Update"]/*[[".buttons[\"Update\"].staticTexts[\"Update\"]",".staticTexts[\"Update\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["New Survey........................"]/*[[".buttons[\"New Survey........................\"].staticTexts[\"New Survey........................\"]",".staticTexts[\"New Survey........................\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let yesStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["YES"]/*[[".buttons[\"YES\"].staticTexts[\"YES\"]",".staticTexts[\"YES\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        yesStaticText.tap()
        yesStaticText.tap()
        yesStaticText.tap()
        yesStaticText.tap()
        app.alerts["Information"].scrollViews.otherElements.buttons["OK"].tap()
        
        
    }
    
}
//let app = XCUIApplication
//app.launch()

//
//  KalculatorUITests.swift
//  KalculatorUITests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest

final class KalculatorUITests: XCTestCase {

    var app:XCUIApplication?
    
    override func setUpWithError() throws {
      
        continueAfterFailure = false
    }
    
    func testExample() throws {
        
        // Get all the buttons
        if let buttons = app?.buttons{
            XCTAssert(true)
        }
        
        
        
        let app = XCUIApplication()
        for number in 0...9 {
            let button = app.buttons["\(number)"]
            button.tap()
            XCTAssertTrue(button.exists)
        }
        
        
        let plusBtn = app.buttons["+"]
        plusBtn.tap()
        XCTAssertTrue(plusBtn.exists)
        
        let subBtn = app.buttons["-"]
        subBtn.tap()
        XCTAssertTrue(subBtn.exists)
        
        let mulBtn = app.buttons["*"]
        mulBtn.tap()
        XCTAssertTrue(plusBtn.exists)
        
        let divBtn = app.buttons["/"]
        XCTAssertTrue(divBtn.exists)
        
        let clearBtn = app.buttons["C"]
        clearBtn.tap()
        XCTAssertTrue(clearBtn.exists)
        
        
        
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        let resultLabel = app.staticTexts["Result Screen"]
        XCTAssertTrue(resultLabel.exists)
        XCTAssertEqual(resultLabel.label, "3")
        
        
        app.buttons["1"].tap()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        let resultLabel2 = app.staticTexts["Result Screen"]
        XCTAssertTrue(resultLabel2.exists)
        XCTAssertEqual(resultLabel2.label, "Err")
                
    }

}

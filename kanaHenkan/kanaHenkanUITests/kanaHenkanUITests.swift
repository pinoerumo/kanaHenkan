//
//  kanaHenkanUITests.swift
//  kanaHenkanUITests
//
//  Created by boko on 2020/03/16.
//  Copyright © 2020 boko. All rights reserved.
//

import XCTest
@testable import kanaHenkan

class kanaHenkanUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // 変換TFを取得
        let conversiontfTextField = app.textFields["conversionTF"]
        // 変換ボタンを取得
        let convrsionButton = XCUIApplication().buttons["conversionButton"]
        // 警告ラベルを取得
        let cautionLabel = XCUIApplication().staticTexts["cautionLabel"]
        //警告ラベルが非表示になっているか
        XCTAssertFalse(cautionLabel.exists)
        //0文字の状態でボタンをタップ
        convrsionButton.tap()
        //警告ラベルが表示しているか
        XCTAssertTrue(cautionLabel.exists)
        //TFをタップ
        conversiontfTextField.tap()
        //文字を入力
        app.typeText("test")
        //警告ラベルが非表示になっているか
        XCTAssertFalse(cautionLabel.exists)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

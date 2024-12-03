//
//  KBCTaskTests.swift
//  KBCTaskTests
//
//  Created by Galya Petrova on 2.12.24.
//

import XCTest
@testable import KBCTask

class KBCTaskTests: XCTestCase {

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCarModelValidation() {
            XCTAssertTrue(isValidCarModel("BMW"))
            XCTAssertFalse(isValidCarModel("Fi"))
        }
        
        func testTrafficLightSequence() {
            let sequence: [TrafficLightType] = [.red, .yellow, .green]
            XCTAssertEqual(sequence[0], .red)
            XCTAssertEqual(sequence[1], .yellow)
            XCTAssertEqual(sequence[2], .green)
        }
    
    func testTrafficLightDurations() {
        XCTAssertEqual(TrafficLightType.green.duration, 4.0, "Green light should be 4 seconds.")
        XCTAssertEqual(TrafficLightType.yellow.duration, 1.0, "Yellow light should be 1 second.")
        XCTAssertEqual(TrafficLightType.red.duration, 4.0, "Red light should be 4 seconds.")
    }
    
    func testLightTransitionWithDurations() {
           let greenLight = TrafficLightType.green
           let yellowLight = TrafficLightType.yellow
           let redLight = TrafficLightType.red
           
           let firstTransition = TrafficLightType.nextLight(after: greenLight)
           XCTAssertEqual(firstTransition, yellowLight, "After green, the light should transition to yellow.")
           
           let secondTransition = TrafficLightType.nextLight(after: yellowLight)
           XCTAssertEqual(secondTransition, redLight, "After yellow, the light should transition to red.")
           
           let thirdTransition = TrafficLightType.nextLight(after: redLight)
           XCTAssertEqual(thirdTransition, greenLight, "After red, the light should transition to green.")
       }
        
        private func isValidCarModel(_ carModel: String) -> Bool {
            return carModel.count >= 3
        }

}

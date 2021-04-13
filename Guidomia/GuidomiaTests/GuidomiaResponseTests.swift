//
//  GuidomiaResponseTests.swift
//  GuidomiaTests
//
//  Created by Rohan Aurora on 4/13/21.
//

import XCTest
@testable import Guidomia

class GuidomiaTests: XCTestCase {
    
    override func tearDown() {
        super.tearDown()
    }
    
    func loadJson(filename fileName: String) -> [Cars]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Cars].self, from: data)
                return jsonData
            } catch {
                print("Error:\(error)")
            }
        }
        return nil
    }
    
    func testJSONData() {
        let data = loadJson(filename: "car_list")
        let make = data?[0].make
        XCTAssertNotNil(make)
        XCTAssertTrue(make == "Land Rover")
    }

}

//
//  ContentTests.swift
//  GuidomiaTests
//
//  Created by Rohan Aurora on 4/14/21.
//

import XCTest
@testable import Guidomia

enum TestErrors: Error {
    case badFileName
}

class ContentTests: XCTestCase {
    
    /// Decodes a type from a bundle filename.
    func decode<T: Decodable>(_ type: T.Type, from filename: String) throws -> T {
        guard let json = Bundle.main.url(forResource: filename, withExtension: nil) else {
            throw TestErrors.badFileName
        }

        let jsonData = try Data(contentsOf: json)
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: jsonData)
        return result
    }
    
    func testFileName() {
        let expected = "car_list"
        let fileName = Constants.carList
        XCTAssertTrue(expected == fileName)
    }
    
    /// Tests if JSON is structurally correct.
    func testValidJSON() throws {
        _ = try? decode([Cars].self, from: "car_list.json")
    }
    
    func testInvalidJSON() {
        let invalid = try? decode([Cars].self, from: "car_list_invalid.json")
        XCTAssertNil(invalid, "Data should be nil because the json is invalid")
    }
    
    
    func testIncorrectFile() {
        let incorrect = try? decode([Cars].self, from: "car_list.py")
        XCTAssertNil(incorrect, "Data should be nil because the file is incorrect")
    }
}

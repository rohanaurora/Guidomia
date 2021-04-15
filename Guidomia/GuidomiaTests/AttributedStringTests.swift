//
//  AttributedStringTests.swift
//  GuidomiaTests
//
//  Created by Rohan Aurora on 4/14/21.
//

import XCTest
@testable import Guidomia

class AttributedStringTests: XCTestCase {

    let expected = "•  A sentence with a bullet"

    /// Ensure the string has bullet.
    func testBulletInString() {
        let input = ["A sentence with a bullet"]
        let aStr = NSAttributedString().displayBulletedText(for: input)
        XCTAssert(aStr.string.contains(expected), "Check again! \(input) is not matching with \(aStr)")
    }
}

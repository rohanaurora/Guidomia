//
//  ViewModelTests.swift
//  GuidomiaTests
//
//  Created by Rohan Aurora on 4/13/21.
//

import XCTest
@testable import Guidomia

class ViewModelTests: XCTestCase {
    
    var carVM: CarVM!
    var carArray: [Cars]!
    
    override func setUp() {
        super.setUp()
        
        carVM = CarVM()
        carArray = carVM.datasource
        
        if carArray == nil {
            XCTFail("Missing data in the array. Check the JSON file being used in view model.")
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testMakeData() {
        let make = carArray?[0].make
        XCTAssertNotNil(make)
        XCTAssertTrue(make == "Land Rover")
        XCTAssertFalse(make == "Honda")
    }
    
    func testConsList() {
        let consList = carArray?[0].consList
        XCTAssertNotNil(consList)
        XCTAssertTrue(consList == ["Bad direction"])
        XCTAssertFalse(consList == ["Sometimes explode"])
        
    }
    
    func testProsList() {
        let prosList = carArray?[0].prosList
        XCTAssertNotNil(prosList)
        XCTAssertTrue(prosList == ["You can go everywhere", "Good sound system"])
        XCTAssertFalse(prosList == ["", ""])
    }
    
    func testCustomerPrice() {
        let cPrice = carArray?[0].customerPrice
        XCTAssertNotNil(cPrice)
        XCTAssertTrue(cPrice == 120000.0)
    }
    
    func testMarketPrice() {
        let mPrice = carArray?[0].marketPrice
        XCTAssertNotNil(mPrice)
        XCTAssertTrue(mPrice == 125000.0)
    }
    
    func testCarModel() {
        let cModel = carArray?[1].model
        XCTAssertNotNil(cModel)
        XCTAssertTrue(cModel == "Roadster")
        
    }
    
    func testRating() {
        let rating = carArray?[0].rating
        XCTAssertNotNil(rating)
        XCTAssertTrue(rating == 3)
        XCTAssertFalse(rating == 0)
    }
    
    func testCarImages() {
        let landRoverImage = carArray?[0].carImage()
        XCTAssertNotNil(landRoverImage)
        
        let mercImage = carArray?[3].carImage()
        XCTAssertNotNil(mercImage)

        let expectedLR = UIImage(named: "Range_Rover")
        let expectedMerc = UIImage(named: "Mercedez_benz_GLC")
        let incorrectMerc = UIImage(named: "MercedezBenzGLC")

        XCTAssert(landRoverImage == expectedLR)
        XCTAssert(mercImage == expectedMerc)
        XCTAssertFalse(mercImage == incorrectMerc)
    }
}

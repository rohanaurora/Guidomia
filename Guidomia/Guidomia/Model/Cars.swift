//
//  Cars.swift
//  Guidomia
//
//  Created by Rohan Aurora on 4/13/21.
//

import Foundation

struct Cars: Codable {
    
    enum CodingKeys: String, CodingKey {
        case consList       = "consList"
        case customerPrice  = "customerPrice"
        case make           = "make"
        case marketPrice    = "marketPrice"
        case model          = "model"
        case prosList       = "prosList"
        case rating         = "rating"
    }
    
    var consList: [String]
    var customerPrice: Double
    var make: String
    var marketPrice: Double
    var model: String
    var prosList: [String]
    var rating: Int
}

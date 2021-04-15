//
//  Cars.swift
//  Guidomia
//
//  Created by Rohan Aurora on 4/13/21.
//

import UIKit

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
    
    func carModelAndMake() -> String {
        return make + Constants.space + model
    }
    
    func carDisplayPrice() -> String {
        let intPrice = Int((customerPrice/1000))
        return Constants.priceString + String(intPrice) + Constants.thousand
    }
    
    func carRating() -> String {
        var star = Constants.star
        let spacePlusStar = Constants.space + star
        for _ in 1..<rating {
            star.append(spacePlusStar)
        }
        return star
    }
    
    func carProsHide() -> Bool {
        return prosList.count == 0 ? true: false
    }
    
    func carConsHide() -> Bool {
        return consList.count == 0 ? true: false
    }

    // TODO: - Make enum
    func carImage() -> UIImage {
        if make.contains("BMW") {
            return UIImage(named: "BMW_330i") ?? UIImage()
        } else if make.contains("Toyota") {
            return UIImage(named: "Tacoma") ?? UIImage()
        } else if make.contains("Land") {
            return UIImage(named: "Range_Rover") ?? UIImage()
        } else if make.contains("Alpine") {
            return UIImage(named: "Alpine_roadster") ?? UIImage()
        } else if make.contains("Mercedes") {
            return UIImage(named: "Mercedez_benz_GLC") ?? UIImage()
        } else {
            return UIImage()
        }
    }
}


//
//  ViewModel.swift
//  Guidomia
//
//  Created by Rohan Aurora on 4/13/21.
//

import Foundation

final class CarVM {
    public var datasource: [Cars]?

    init() {
        datasource = loadJson(filename: Constants.carList)
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
}

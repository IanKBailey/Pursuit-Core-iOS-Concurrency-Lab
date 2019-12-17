//
//  CountryModel.swift
//  Concurreny
//
//  Created by Ian Bailey on 12/11/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var name: String
    var capital: String
    var population: Double
    var alpha2Code: String

}

extension Country {
    static func getCountryData(data: Data) -> [Country] {
        var countryData = [Country]()
        do {
            countryData = try JSONDecoder().decode([Country].self, from: data)
            
        } catch {
            fatalError("\(error)")
        }
        return countryData
    }
}

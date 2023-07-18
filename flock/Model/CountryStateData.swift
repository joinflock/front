//
//  CountryStateData.swift
//  flock
//
//  Created by James Zhang on 7/18/23.
//

import Foundation

struct CountryStateData: Codable, Identifiable, Hashable {
    let name: String
    var id: String {name}
    
    static let allCountryState : [CountryStateData] = Bundle.main.decode("countriesStates.json")
}

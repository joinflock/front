//
//  UniversitiesData.swift
//  flock
//
//  Created by James Zhang on 7/17/23.
//

import Foundation

struct UniversitiesData: Codable, Identifiable, Hashable {
    let institution: String
    var id: String {institution}
    
    static let allUni : [UniversitiesData] = Bundle.main.decode("usInstitutions.json")
}

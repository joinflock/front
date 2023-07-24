//
//  Profile.swift
//  flock
//
//  Created by James Zhang on 6/28/23.
//

import Foundation

struct Profile: Decodable, Encodable {
    
    // Basic details, from onboarding.
    var firstName: String
    var lastName: String
    var phoneNumber: String
   // var phoneVerified : Bool
    var countryCode: String
    var birthday: Date
    
    // Build Profile details.
    var university : String
    var collegeEmail : String
    var languages_known: String
    var homeCountryState : String
    
    var gender: String
    var ethnicity: [Bool]
    
    var interests: [String]
    var preferences: String
    
    // Best way to represent?
    var paths : [Path]? = nil
    
//    var interests : String
    
    static let `default` = Profile(firstName: "", lastName: "", phoneNumber: "", countryCode: "", birthday: Date(), university: "", collegeEmail: "",
                                   languages_known: "", homeCountryState: "", gender: "", ethnicity: [Bool](repeating: false, count: 8), interests: [], preferences: "")
    
}

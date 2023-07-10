//
//  Profile.swift
//  flock
//
//  Created by James Zhang on 6/28/23.
//

import Foundation

struct Profile {
    
    // Basic details, from onboarding.
    var firstName: String
    var lastName: String
    var phoneNumber: String
   // var phoneVerified : Bool
    var countryCode: String
    var birthday: Date
    
    // Build Profile details.
    var university : String
    var languages_known: String
    var hometown : String
    
    var gender: String
    var ethnicity: String
    var affinities: String
    
//    var interests : String
    
    static let `default` = Profile(firstName: "", lastName: "", phoneNumber: "", countryCode: "", birthday: Date(), university: "",
                                   languages_known: "", hometown: "", gender: "", ethnicity: "", affinities: "")
    
}

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
    var phoneNum: String
   // var phoneVerified : Bool
    var countryCode: String
    var birthday: Date
    
    // Build Profile details.
    var university : String
    var languages_known: String
    var hometown : String
    
    static let `default` = Profile(firstName: "", lastName: "", phoneNum: "", countryCode: "", birthday: Date(), university: "",
    languages_known: "", hometown: "")
    
}

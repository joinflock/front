//
//  Profile.swift
//  flock
//
//  Created by James Zhang on 6/28/23.
//

import Foundation

struct Profile {
    var firstName: String
    var lastName: String
    var phoneNum: String
   // var phoneVerified : Bool
    var countryCode: String
    var birthday: Date
    
    static let `default` = Profile(firstName: "", lastName: "", phoneNum: "", countryCode: "", birthday: Date())
    
}

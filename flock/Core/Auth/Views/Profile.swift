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
    
    var birthday = Date()
    
    static let `default` = Profile(firstName: "James", lastName: "Jack", phoneNum: "9088123201")
    
}

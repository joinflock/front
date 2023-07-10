//
//  OnboardingManager.swift
//  flock
//
//  Created by Jack O'Donnell on 7/7/23.
//

import Foundation

final class OnboardingManager: ObservableObject {
    
    enum Screen: Int, CaseIterable {
        case name
        case birthday
        case phoneNumber
        case phoneVerification
        case build
        case identity
        case interests
        case hobbies
        case preferences
        case profilePicture
    }
    
    @Published var active: Screen = Screen.allCases.first!
    @Published var profile = Profile(firstName: "", lastName: "", phoneNumber: "",                              countryCode: "", birthday: Date(),
                                     university: "", languages_known: "",
                                     hometown: "", gender: "", ethnicity: "",
                                     affinities: "")
    
    // go to next screen
    func next() {
        
        // check if last screen
        let nextScreenIndex = min(active.rawValue + 1, Screen.allCases.last!.rawValue)
        if let screen = Screen(rawValue: nextScreenIndex) {
            active = screen
        }
    }
    
    // go back to previous screen
    func prev() {
        
        // check if first screen
        let prevScreenIndex = max(active.rawValue - 1, Screen.allCases.first!.rawValue)
        if let screen = Screen(rawValue: prevScreenIndex) {
            active = screen
        }
    }
}

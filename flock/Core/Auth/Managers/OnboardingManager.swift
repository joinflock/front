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
        case language
        case identity
        case interests
        case preferences
        case profilePicture
    }
    
    var otpModel: OTPViewModel = .init()
    
    @Published var active: Screen = Screen.allCases.first!
    @Published var profile = Profile(firstName: "", lastName: "", phoneNumber: "", countryCode: "",
                                     birthday: Date(), university: "", collegeEmail: "", languages_known: "",
                                     homeCountryState: "", gender: "", ethnicity: [], interests: [], preferences: "")
    
    @Published var hasError = false
    @Published var error: RegistrationError?
    

    
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
    
    func validateName() {
        hasError = profile.firstName.isEmpty || profile.lastName.isEmpty
        error = hasError ? .emptyName : nil
    }
    
    func validatePhoneNumber() {
        hasError = profile.phoneNumber.count != 10
        error = hasError ? .invalidPhoneNumber : nil
    }
    
    func validateBeginField() {
        hasError = profile.university.isEmpty || profile.homeCountryState.isEmpty || profile.languages_known.isEmpty
        error = hasError ? .emptyField : nil
    }
    
    func validateIdentityField() {
        hasError = profile.gender.isEmpty ||  profile.ethnicity.isEmpty
        error = hasError ? .emptyField : nil
    }
    
    // creates a profile and generates an OTP
    func postProfile() {
        createProfile()
        otpModel.postOtp()
    }
    
//    func validateOtp() {
//        otpModel.
//    }
    
    func createProfile() {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode(profile)
        
        Network.shared.request(methodType: .POST(data: data), "accounts/register",
                               type: Profile.self) { res in
            switch res {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func postOnboarding() {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode(profile)
        
        print("Post Onboarding")
        print(data)
        
        Network.shared.request(methodType: .POST(data: data), "accounts/build/", type: Profile.self) { res in
            switch res {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
            
        }
    }
}

extension OnboardingManager {
    enum RegistrationError: LocalizedError {
        case emptyName
        case invalidPhoneNumber
        case emptyField

        var errorDescription: String? {
            switch self {
            case .emptyName:
                return "please use your full name!"
            case .invalidPhoneNumber:
                return "please enter a valid phone number"
            case .emptyField:
                return "please complete all the information"
            }


        }
    }
}

//
//  SessionManager.swift
//  flock
//
//  Created by Jack O'Donnell on 7/7/23.
//

import Foundation

final class SessionManager: ObservableObject {
    
    enum UserDefaultKeys {
        static let hasSeenOnboarding = "hasSeenOnboarding"
    }
    
    enum CurrentState {
        case loggedIn
        case loggedOut
        case onboarding
    }
    
    @Published private(set) var currentState: CurrentState?
    
    func signIn() {
        currentState = .loggedIn
    }
    
    func signOut() {
        currentState = .loggedOut
    }
    
    func configureCurrentState() {
        let hasCompletedOnboarding = UserDefaults.standard.bool(forKey: UserDefaultKeys.hasSeenOnboarding)
        currentState = hasCompletedOnboarding ? .loggedOut: .onboarding
    }
}


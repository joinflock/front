//
//  ContentView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var session = SessionManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch session.currentState {
                case .onboarding:
                    //                testView()
                    OnboardingView()
                        .environmentObject(session)
                case .loggedIn:
                    ProfileView()
                        .environmentObject(session)
                case .loggedOut:
                    StarterView()
                        .environmentObject(session)
                default:
                    Color.white.ignoresSafeArea()
                }
            }
            .onAppear(perform: session.configureCurrentState)
        }
        .toolbar(.hidden)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var session = SessionManager()
    @EnvironmentObject var network: Network
    
    // For navigation bar.
    @State private var selection: Tab = .profile    // profile as default?
    
    enum Tab {
        case individuals
        case communities
        case messages
        case profile
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch session.currentState {
                case .onboarding:
                    //                testView()
                    OnboardingView()
                        .environmentObject(session)
                        .ignoresSafeArea()
                case .loggedIn:
                    MasterProfileView() {}
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
            .environmentObject(Network())
    }
}

//
//  OnboardingView.swift
//  flock
//
//  Created by Jack O'Donnell on 7/8/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject private var manager = OnboardingManager()
    @State private var showPrevBtn = false
    
    var body: some View {
        ZStack {
            TabView(selection: $manager.active){
                
                NameView(firstName: $manager.profile.firstName, lastName: $manager.profile.lastName) {
                    manager.validateName()
                    if !manager.hasError {
                        manager.next()
                    }
                }
                    .tag(OnboardingManager.Screen.name)
                BirthdayView(birthday: $manager.profile.birthday, action: manager.next)
                    .tag(OnboardingManager.Screen.birthday)
                PhoneInputView(phoneNumber: $manager.profile.phoneNumber, ctryCode: $manager.profile.countryCode) {
                    manager.validatePhoneNumber()
                    if !manager.hasError {
                        manager.next()
                    }
                }
                    .tag(OnboardingManager.Screen.phoneNumber)
                OnboardingVerificationView (action: manager.next)
                    .tag(OnboardingManager.Screen.phoneVerification)
                BeginBuildView(university: $manager.profile.university, languagesKnown: $manager.profile.languages_known, hometown: $manager.profile.hometown) {
                    manager.validateBeginField()
                    if !manager.hasError {
                        manager.next()
                    }
                }
                    .tag(OnboardingManager.Screen.build)
                IdentityView(gender: $manager.profile.gender, ethnicity: $manager.profile.ethnicity, affinities: $manager.profile.affinities) {
                    manager.validateIdentityField()
                    if !manager.hasError {
                        manager.next()
                    }
                }
                    .tag(OnboardingManager.Screen.identity)
                InterestsView(action: manager.next)
                    .tag(OnboardingManager.Screen.interests)
                HobbiesView(action: manager.next)
                    .tag(OnboardingManager.Screen.hobbies)
                PreferencesView(action: manager.next)
                    .tag(OnboardingManager.Screen.preferences)
                PictureUploadView {}
                    .tag(OnboardingManager.Screen.profilePicture)
                
                
            }
            .animation(.easeInOut, value: manager.active)
            .tabViewStyle(.page(indexDisplayMode: .never))
            
        }
        .overlay(alignment: .topLeading) {
            if showPrevBtn {
                Button(action: manager.prev) {
                    Image(systemName: "chevron.backward")
                        .symbolVariant(.fill)
                        .foregroundColor(.accentColor)
                        .font(.system(size: 25,
                                      weight: .bold,
                                      design: .rounded))
                        .padding(.leading, 20)
                }
            }
        }
        .animation(.easeInOut, value: showPrevBtn)
        .onAppear {
            UIScrollView.appearance().isScrollEnabled = false
        }
        .onDisappear {
            UIScrollView.appearance().isScrollEnabled = true
        }
        .onChange(of: manager.active) { newValue in
            showPrevBtn = newValue != OnboardingManager.Screen.allCases.first
        }
//        .ignoresSafeArea()
        .alert(isPresented: $manager.hasError, error: manager.error) {}
        .navigationBarBackButtonHidden()
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

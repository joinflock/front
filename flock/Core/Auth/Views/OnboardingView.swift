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
    
    // FOR TESTING
    let checksOff = false
    
    var body: some View {
        ZStack {
            TabView(selection: $manager.active){
                
                NameView(firstName: $manager.profile.firstName, lastName: $manager.profile.lastName) {
                    manager.validateName()
                    if !manager.hasError || checksOff {
                        manager.next()
                    }
                }
                    .tag(OnboardingManager.Screen.name)
                BirthdayView(birthday: $manager.profile.birthday, action: manager.next)
                    .tag(OnboardingManager.Screen.birthday)
                PhoneInputView(phoneNumber: $manager.profile.phoneNumber, ctryCode: $manager.profile.countryCode) {
                    manager.validatePhoneNumber()
                    manager.postProfile()
                    if !manager.hasError || checksOff {
                        manager.next()
                    }
                }
                    .tag(OnboardingManager.Screen.phoneNumber)
                OnboardingVerificationView (action: manager.next)
                    .tag(OnboardingManager.Screen.phoneVerification)
                BeginBuildView(university: $manager.profile.university, collegeEmail: $manager.profile.collegeEmail, homeCountryState: $manager.profile.homeCountryState) {
                    manager.validateBeginField()
                    if !manager.hasError || checksOff {
                        manager.next()
                    }
                }
                    .tag(OnboardingManager.Screen.build)
                LanguageView(languages: $manager.profile.languages_known) {
                    manager.validateLanguageField()
                    if !manager.hasError {
                        manager.next()
                    }
                }
                    .tag(OnboardingManager.Screen.language)
                IdentityView(gender: $manager.profile.gender, ethnicity: $manager.profile.ethnicity) {
                    manager.validateIdentityField()
                    if !manager.hasError {
                        manager.next()
                    }
                }
                    .tag(OnboardingManager.Screen.identity)
                InterestsView(interests: $manager.profile.interests) {
                    manager.validateInterestsField()
                    if !manager.hasError {
                        manager.next()
                    }
                }
                    .tag(OnboardingManager.Screen.interests)
                PreferencesView(action: manager.next)
                    .tag(OnboardingManager.Screen.preferences)
                PictureUploadView (action: manager.postOnboarding)
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
                        .padding(.top, 40)
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

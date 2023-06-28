//
//  OnboardingView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/26/23.
//

import SwiftUI

struct OnboardingView: View {
    
    // Onboarding states:
    /*
     0 - Choices view
     1 - Add name
     2 - Add birthday
     3 - Add phone number
     4 - Welcome screen
     */
    @State var onboardingState: Int = 0
    
    // state variables to be inputted
    @State var first_name: String = ""
    @State var last_name: String = ""
    @State var birthday: String = ""
    @State var phone: String = ""
    
    // alert for validity
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0: choicesSection
                case 1: nameSection
                case 2: birthdaySection
                case 3: phoneSection
                case 4: welcomeSection
                default: RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(Color.theme.accent)
                }
            }
            .padding(.horizontal, 60)
            
            
            // buttons
            VStack {
                Spacer()
                
                // For new users, leads to onboarding.
                Button{
                    handleNextButtonPressed()
                } label: {
                    onboardingState == 0 ?
                    Text("get started")
                        .frame(width: 280, height: 16):
                    Text("next")
                        .frame(width: 280, height: 16)
                }
                .font(.poppins(.semibold, size: 18))
                .buttonStyle(FilledButton())
                .padding(.top, 5)
                
                
                // Returning users, login
                onboardingState == 0 ? NavigationLink {
                    LoginView()
                } label: {
                        Text("login")
                            .font(.poppins(.semibold, size: 18))
                            .frame(width: 280, height: 16)
                }
                .buttonStyle(OutlinedButton()) : nil
                
                
                // if on choices screen, show bottom text
                onboardingState == 0 ?
                Text("by creating an account, you are agreeing to \n our [terms and conditions](https://www.google.com) and [privacy policy](https://www.google.com)")
                    .padding(.bottom, 40)
                    .font(.poppins(.light, size: 10))
                : nil
                
                
            }
            .padding(30)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

// MARK: Components

extension OnboardingView {
    
    // initial choices screen
    private var choicesSection: some View {
        VStack(alignment: .center) {
            Text("flock")
                .font(.poppins(.bold, size: 40))
            Text("find your people.")
                .font(.poppins(.medium, size: 20))
                .padding(.bottom, 200)
        }
    }
    
    // name screen
    private var nameSection: some View {
        VStack(spacing: 15) {
            
            Text("what's your name?")
                .font(.poppins(.semibold))
                .foregroundColor(Color.theme.text)
            
            CustomInputField(imageName: "circle", placeholderText: "first name", text: $first_name)
            CustomInputField(imageName: "circle", placeholderText: "last name", text: $last_name)
            
            Text("use your real name so people know \n who you are!")
                .font(.poppins(.regular, size: 12))
                .foregroundColor(Color.theme.text)
                .multilineTextAlignment(.center)
                .padding(.bottom, 100)
        }
    }
    
    // birthday screen
    private var birthdaySection: some View {
        VStack(spacing: 15) {
            
            Text("when's your birthday?")
                .font(.poppins(.semibold, size: 20))
                .foregroundColor(Color.theme.text)
            
            CustomInputField(imageName: "circle", placeholderText: "mm / dd / yy", text: $birthday)
                .padding([.leading, .trailing], 32)
            
            Text("flock is for 17+ only")
                .font(.poppins(.regular, size: 12))
                .foregroundColor(Color.theme.text)
                .padding(.bottom, 100)
        }
    }
    
    // phone screen
    private var phoneSection: some View {
        VStack(spacing: 15) {
            
            Text("and we need your digits...")
                .font(.poppins(.semibold, size: 20))
                .foregroundColor(Color.theme.text)
            
            CustomInputField(imageName: "circle", placeholderText: "phone number", text: $phone)
            
            Text("we'll use this to log you in")
                .font(.poppins(.regular, size: 12))
                .foregroundColor(Color.theme.text)
                .padding(.bottom, 100)
        }
    }
    
    // animation after completing initial onboarding
    private var welcomeSection: some View {
        VStack {
            Text("welcome to \n flock")
                .font(.poppins(.bold, size: 40))
                .multilineTextAlignment(.center)
            Text("swipe to build your profile")
                .font(.poppins(.regular, size: 18))
                .foregroundColor(Color.theme.accent)
                .padding(.top, 120)
            
            //TODO: add arrows here
        }
    }
}

// MARK: Functions

extension OnboardingView {
    
    func handleNextButtonPressed() {
        // check inputs
        switch onboardingState {
        case 1:
            guard first_name.count >= 2 && last_name.count >= 2 else {
                showAlert(title: "your name must be at least two characters long!")
                    return
            }
        case 2: break
            // make sure birthday is valid
            // guard
        case 3: break
            // make sure phone number is valid
        default: break
        }
        
        if onboardingState == 3 {
            // sign in function here
        } else {
            // transition here
            
            onboardingState += 1
        }
        
    }
    
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
}

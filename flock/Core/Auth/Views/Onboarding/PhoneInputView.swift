//
//  PhoneInputView.swift
//  flock
//
//  Created by James Zhang on 6/29/23.
//

import SwiftUI
import Combine

struct PhoneInputView: View {
    @EnvironmentObject var modelData : ModelData
    
    @State private var presentSheet = false
    @State private var countryCode : String = "+1"
    @State private var countryFlag : String = "🇺🇸"
    
    // Help with spacing (xxx xxx xxxx) when typing in phone number. Removed for now. 
//    @State private var oldValue : String = ""
    
   // @State private var countryPattern : String = "### ### ####"
   // @State private var countryLimit : Int = 17
    @State private var searchCountry: String = ""
    // @FocusState private var keyIsFocused: Bool
    
    // Character limit for mobile phone numbers.
    let characterLimit = 10
    
    // Help with filtering country searches.
    var filteredResults: [CountryPhoneData] {
        if searchCountry.isEmpty {
            return countries
        } else {
            return countries.filter { $0.name.contains(searchCountry) }
        }
    }
    
    let countries: [CountryPhoneData] = Bundle.main.decode("CountryNumbers.json")
    
    var body: some View {
        VStack (alignment: .center, spacing: 15) {
            Text("and we need your digits...")
                .font(.poppins(.semibold, size: 23))
                .foregroundColor(Color.theme.text)
                .padding(.bottom, 5)
                .padding(.top, 30)
            
            HStack {
                Button {
                    presentSheet = true
                  //  keyIsFocused = false
                } label: {
                    Text("\(countryFlag) \(countryCode)")
                        .padding(8)
                        .foregroundColor(Color.theme.text)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 0.7)
                        .frame(height: 40)
                )
                .padding(.leading, 45)
                
                CustomInputField(imageName: "circle", placeholderText: "phone number", text: $modelData.profile.phoneNum)
                    .padding(.trailing, 45)
                    .padding(.leading, 5)
                    .foregroundColor(Color.theme.text)
                    .keyboardType(.phonePad)
                    .onChange(of: modelData.profile.phoneNum) { newValue in

//                        if (newValue.count == 3 || newValue.count == 7) &&
//                            (oldValue.count == 2 || oldValue.count == 6){
//                            modelData.profile.phoneNum = String(newValue + " ")
//                        }
//                        else if (newValue.count == 4 || newValue.count == 8) && (oldValue.count == 5 || oldValue.count == 9)
//                        {
//                            modelData.profile.phoneNum = String(newValue.dropLast())
//                        }
                        if newValue.count > characterLimit {
                            modelData.profile.phoneNum = String(newValue.prefix(characterLimit))
                        }
                        
//                        oldValue = newValue
                    }
            }
    
            
            Text("we'll use this to log you in")
                .font(.poppins(.regular, size: 12))
                .foregroundColor(Color.theme.text)
                .multilineTextAlignment(.center)
                .padding(.bottom, 100)
            
            // Move onto next onboarding step.
            NavigationLink {
                OnboardingVerificationView()
                    .environmentObject(modelData)
            } label: {
                Text("next")
                    .frame(width: 280, height: 16)
                    .font(.poppins(.semibold, size: 18))
            }
            .buttonStyle(FilledButton())
            .padding(.top, 80)
            
            
        }
        .sheet(isPresented: $presentSheet) {
            NavigationView {
                List(filteredResults) { country in
                    HStack {
                        Text(country.flag)
                        Text(country.name)
                            .font(.headline)
                        Spacer()
                        Text(country.dial_code)
                            .foregroundColor(.secondary)
                    }
                    .onTapGesture {
                        self.countryFlag = country.flag
                        self.countryCode = country.dial_code
                        
                        // Needs to have a $ prefix?
                        modelData.profile.countryCode = self.countryCode
                        //self.countryPattern = country.pattern
                       // self.countryLimit = country.limit
                        presentSheet = false
                        searchCountry = ""
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchCountry, prompt: "Your country")
        
            }
            .presentationDetents([.medium, .large])
        }
    }
}

struct PhoneInputView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneInputView()
            .environmentObject(ModelData())
    }
}

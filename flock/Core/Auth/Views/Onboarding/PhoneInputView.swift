//
//  PhoneInputView.swift
//  flock
//
//  Created by James Zhang on 6/29/23.
//

import SwiftUI
import Combine

struct PhoneInputView: View {
    @Binding var phoneNumber: String
    @Binding var ctryCode: String
    
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
    
    let action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack (alignment: .center) {
               
                Text("and we need your digits...")
                   
                    .font(.system(size: 35, weight: .semibold))                    .foregroundColor(Color.theme.text)
                    .padding(.top, geometry.size.height * 0.25)
                    .padding(.bottom, geometry.size.height * 0.1)
                
                
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
                            .stroke(Color.black, lineWidth: 1)
                            .frame(height: geometry.size.height * 0.06)
                    )
                    
                    CustomInputField(imageName: "circle", placeholderText: "phone number", text: $phoneNumber)
                        .padding(.leading,  geometry.size.width * 0.01)
                        .foregroundColor(Color.theme.text)
                        .keyboardType(.numberPad)
                        .onChange(of: phoneNumber) { newValue in
                            
                            //                        if (newValue.count == 3 || newValue.count == 7) &&
                            //                            (oldValue.count == 2 || oldValue.count == 6){
                            //                            modelData.profile.phoneNum = String(newValue + " ")
                            //                        }
                            //                        else if (newValue.count == 4 || newValue.count == 8) && (oldValue.count == 5 || oldValue.count == 9)
                            //                        {
                            //                            modelData.profile.phoneNum = String(newValue.dropLast())
                            //                        }
                            if newValue.count > characterLimit {
                                phoneNumber = String(newValue.prefix(characterLimit))
                            }
                            
                            //                        oldValue = newValue
                        }
                }
                
                
                Text("we'll use this to log you in")
                    .font(.system(size: 16, weight: .regular))                    .foregroundColor(Color.theme.text)
                    .multilineTextAlignment(.center)
                    .padding(.top, geometry.size.height * 0.01)
                Spacer()
                
                // Move onto next onboarding step.
                Button {
                    action()
                } label: {
                    Text("next")
                        .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)
                    // .padding(.horizontal, geometry.size.width *)
                    .font(.system(size: 20, weight: .semibold))                }
                .buttonStyle(FilledButton())
                .offset(y: -(geometry.size.height * 0.09))

                
            }
            .padding(.horizontal, geometry.size.width * 0.1)

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
                            ctryCode = self.countryCode
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
}

struct PhoneInputView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneInputView(phoneNumber: .constant(""), ctryCode: .constant("")) {}
    }
}

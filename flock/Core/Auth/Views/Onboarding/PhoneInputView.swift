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
    @State private var countryPattern : String = "### ### ####"
//    @State private var countryLimit : Int = 17
    @State private var searchCountry: String = ""
    @FocusState private var keyIsFocused: Bool
    
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
                .padding(.bottom, 15)
            
            HStack {
                Button {
                    presentSheet = true
                    keyIsFocused = false
                } label: {
                    Text("\(countryFlag) \(countryCode)")
                        .padding(8)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 0.7)
                        .frame(height: 40)
                )
                .padding(.leading, 35)
                
                CustomInputField(imageName: "circle", placeholderText: "phone number", text: $modelData.profile.phoneNum)
                    .padding(.trailing, 35)
                    .padding(.leading, 5)
                    .keyboardType(.phonePad)
                    .onChange(of: modelData.profile.phoneNum) { newValue in
                        if newValue.count > characterLimit {
                            modelData.profile.phoneNum = String(newValue.prefix(characterLimit))
                        }
                    }
            }
        }
        .padding(.bottom, 150)
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
                        self.countryPattern = country.pattern
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

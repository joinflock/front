//
//  PhoneNumberView.swift
//  flock
//
//  Created by James Zhang on 6/29/23.
//

import SwiftUI
import Combine

struct PhoneNumberView: View {
    @Binding var profile: Profile
    
    @State var presentSheet = false
    @State var countryCode : String = "+1"
    @State var countryFlag : String = "🇺🇸"
    @State var countryPattern : String = "### ### ####"
    @State var countryLimit : Int = 17
    @State private var searchCountry: String = ""
    @FocusState private var keyIsFocused: Bool
    
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
                    
                    CustomInputField(imageName: "circle", placeholderText: "phone number", text: $profile.phoneNum)
                        .padding(.trailing, 35)
                        .padding(.leading, 5)
                        .focused($keyIsFocused)
                        .keyboardType(.numbersAndPunctuation)
                        .onReceive(Just($profile.phoneNum)) { _ in
                            applyPatternOnNumbers(&profile.phoneNum, pattern: countryPattern, replacementCharacter: "#")
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
                            self.countryLimit = country.limit
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
    
    func applyPatternOnNumbers(_ stringvar: inout String, pattern: String, replacementCharacter: Character) {
        var pureNumber = stringvar.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else {
                stringvar = pureNumber
                return
            }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        stringvar = pureNumber
    }
}


struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView(profile: .constant(.default))
    }
}

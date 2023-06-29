//
//  PhoneNumberView.swift
//  flock
//
//  Created by James Zhang on 6/29/23.
//

import SwiftUI

struct PhoneNumberView: View {
    @Binding var profile: Profile
    
    @State var presentSheet = false
    @State var countryCode : String = "+1"
    @State var countryFlag : String = "🇺🇸"
    @State var countryPattern : String = "### ### ####"
    @State var countryLimit : Int = 17
    @State private var searchCountry: String = ""
    @FocusState private var keyIsFocused: Bool
    
    
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
                      
                }
            }
            .padding(.bottom, 150)
        }
}


struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView(profile: .constant(.default))
    }
}

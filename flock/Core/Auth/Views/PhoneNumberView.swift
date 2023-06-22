//
//  PhoneNumberView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/22/23.
//

import SwiftUI

struct PhoneNumberView: View {
    @State private var phone = ""
    
    var body: some View {
        // parent container
        VStack(alignment: .center) {
            
            VStack(spacing: 15) {
                
                Text("and we need your digits...")
                    .font(.poppins(.semibold, size: 20))
                    .foregroundColor(Color.theme.text)
                    .padding(.top, 100)
                
                CustomInputField(imageName: "circle", placeholderText: "phone number", text: $phone)
                
                Text("we'll use this to log you in")
                    .font(.poppins(.regular, size: 12))
                    .foregroundColor(Color.theme.text)
                
                Button{
                    
                } label: {
                    Text("next")
                        .font(.poppins(.semibold, size: 18))
                        .frame(width: 280, height: 16)
                }
                .buttonStyle(FilledButton())
                .padding(.top, 200)
            }
            .padding(.horizontal, 60)
        }
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView()
    }
}

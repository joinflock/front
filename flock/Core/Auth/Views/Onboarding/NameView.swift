//
//  NameView.swift
//  flock
//
//  Created by James Zhang on 6/28/23.
//

import SwiftUI

struct NameView: View {
    @Binding var profile: Profile

    var body: some View {
        ZStack {
            VStack (spacing: 15) {
                Text("what's your name?")
                    .font(.poppins(.semibold))
                    .foregroundColor(Color.theme.text)
                    .padding(.bottom, 5)
                
                CustomInputField(imageName: "circle", placeholderText: "first name", text: $profile.firstName)
                    .padding(.bottom, 15)
                CustomInputField(imageName: "circle", placeholderText: "last name", text: $profile.lastName)
                    .padding(.bottom, 5)
                
                Text("use your real name so people know \n who you are!")
                    .font(.poppins(.regular, size: 12))
                    .foregroundColor(Color.theme.text)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 100)
                
                NavigationLink {
                    BirthdayView()
                } label: {
                    Text("next")
                        .frame(width: 280, height: 16)
                        .font(.poppins(.semibold, size: 18))
                }
                .buttonStyle(FilledButton())
                .padding(.bottom, 5)
            }
            .padding(.horizontal, 60)
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(profile: .constant(.default))
    }
}

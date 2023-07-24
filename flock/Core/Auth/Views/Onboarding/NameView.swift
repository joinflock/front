//
//  NameView.swift
//  flock
//
//  Created by James Zhang on 6/28/23.
//

import SwiftUI

struct NameView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    
    
    let action: () -> Void
    var body: some View {
        GeometryReader { geometry in
            
            VStack (alignment: .center) {
                
                Text("what's your name?")
                    .font(.system(size: 35, weight: .semibold))
                    .foregroundColor(Color.theme.text)
                    .padding(.top, geometry.size.height * 0.25)
                    .padding(.bottom, geometry.size.height * 0.15)
                
                // Get and store inputs.
                CustomInputField(imageName: "circle", placeholderText: "first name", text: $firstName)
                    .disableAutocorrection(true)
                
                CustomInputField(imageName: "circle", placeholderText: "last name", text: $lastName)
                    .disableAutocorrection(true)
                    .padding(.top, geometry.size.height * 0.04)
                

                Text("use your real name so people know \n who you are!")
                    .multilineTextAlignment(.center)
                    .font(.poppins(.regular, size: 14))
                    .padding(.top, geometry.size.height * 0.03)
                    
              
                    
                Spacer()

                // Move onto next onboarding step.
                Button {
                    action()
                } label: {
                    Text("next")
                        .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)
                        .font(.poppins(.semibold, size: 18))
                }
                .buttonStyle(FilledButton())
                .offset(y: -(geometry.size.height * 0.09))
        
            }
            .padding(.horizontal, geometry.size.width * 0.1)
        }
        
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(firstName: .constant(""), lastName: .constant("")) {}
    }
}

//
//  IdentityView.swift
//  flock
//
//  Created by James Zhang on 7/6/23.
//

import SwiftUI

struct IdentityView: View {
    @Binding var gender: String
    @Binding var ethnicity: String
    
    let action: () -> Void
    
    var body: some View {
        VStack (alignment: .center){
            
            Image("BuildProfile_blurPhoto")
                .padding(.bottom, -180)
                .padding(.top, -20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 0.3)
                    )
                
                VStack {
                    Text("identity")
                        .font(.poppins(.semibold, size: 25))
                        .padding(.top, 30)
                    
                    CustomInputField(imageName: "circle", placeholderText: "gender", text: $gender)
                        .padding(.horizontal, 40)
                        .padding(.top, 50)
                    
                    CustomInputField(imageName: "circle", placeholderText: "ethnicity", text: $ethnicity)
                        .padding(.horizontal, 40)
                        .padding(.top, 35)
                    
                    
                    Spacer()
                    
                    Group {
                        Text("your information is safe with us. view our ") +
                        Text("privacy policy").underline() +
                        Text(" .")
                    }
                    .multilineTextAlignment(.center)
                    .font(.poppins(.regular, size: 12))
                    .padding(.bottom, 15)
                    .padding(.horizontal, 40)
                    
                    
                    // To next build profile prompts!
                    Button {
                        action()
                    } label: {
                        Text("next")
                            .frame(width: 280, height: 16)
                            .font(.poppins(.semibold, size: 18))
                    }
                    .buttonStyle(FilledButton())
                    .padding(.bottom, 30)
                    
                    ProgressView(value: 0.23)   // arbitrarily valued
                        .padding(.horizontal, 40)
                        .padding(.bottom, 70)
                    
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct IdentityView_Previews: PreviewProvider {
    static var previews: some View {
        IdentityView(gender: .constant(""), ethnicity: .constant("")) {}
    }
}

//
//  BeginBuildView.swift
//  flock
//
//  Created by James Zhang on 7/6/23.
//

import SwiftUI

struct BeginBuildView: View {
    @Binding var university: String
    @Binding var collegeEmail: String
    @Binding var hometown: String
    
    let action: () -> Void
    
    var body: some View {
        VStack (alignment: .center){
            
            Image("BuildProfile_blurPhoto")
                .scaledToFill()
                .padding(.bottom, -180)
            
            ZStack {
                // "Card"-like canvas for input. Overlay 2 RRs together since for some reason, two modifiers can't be used together on RR. **
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 0.3)
                    )
                    .ignoresSafeArea()
                
                VStack {
                    Text("we'd hate to waste your time")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.top, 40)
                        .foregroundColor(.secondary)
                    
                    // Grouped to color a specific section of text.
                    Group {
                        Text("let's ") +
                        Text("build your profile ").foregroundColor(Color.theme.accent) +
                        Text("in less than a minute")
                    }
                    .font(.system(size: 25, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    
                    
                    CustomInputField(imageName: "circle", placeholderText: "university", text: $university)
                        .padding(.horizontal, 40)
                        .padding(.top, 20)
                       
                    
                    CustomInputField(imageName: "circle", placeholderText: "college email", text: $collegeEmail)
                        .padding(.horizontal, 40)
                        .padding(.top, 30)
                    
                    AutoCustomInputField(imageName: "circle", placeholderText: "hometown", text: $hometown)
                        .padding(.horizontal, 40)
                        .padding(.top, 30)
                    
                    
                    Spacer()
                    
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
                    
                    ProgressView(value: 0.03)   // arbitrarily valued
                        .padding(.horizontal, 40)
                        .padding(.bottom, 70)
                }
            }

        }
        .ignoresSafeArea()
    }
}

struct BeginBuildView_Previews: PreviewProvider {
    static var previews: some View {
        BeginBuildView(university: .constant(""), collegeEmail: .constant(""), hometown: .constant("")) {}
    }
}

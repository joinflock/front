//
//  BeginBuildView.swift
//  flock
//
//  Created by James Zhang on 7/6/23.
//

import SwiftUI

struct BeginBuildView: View {
    @EnvironmentObject var modelData: ModelData
      
    var body: some View {
        VStack (alignment: .center){
            
            Image("BuildProfile_blurPhoto")
                .padding(.bottom, -125)
                .padding(.top, -20)
            
            ZStack {
                // "Card"-like canvas for input. Overlay 2 RRs together since for some reason, two modifiers can't be used together on RR. **
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 0.3)
                    )
                
                VStack {
                    // Grouped to color a specific section of text.
                    Group {
                        Text("let's ") +
                        Text("build your profile ").foregroundColor(Color.theme.accent) +
                        Text("in less than a minute")
                    }
                    .font(.poppins(.semibold, size: 25))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, 80)
                    
                    CustomInputField(imageName: "circle", placeholderText: "university", text: $modelData.profile.university)
                        .padding(.horizontal, 40)
                        .padding(.top, 20)
                    
                    CustomInputField(imageName: "circle", placeholderText: "languages known", text: $modelData.profile.languages_known)
                        .padding(.horizontal, 40)
                        .padding(.top, 30)
                    
                    CustomInputField(imageName: "circle", placeholderText: "hometown", text: $modelData.profile.hometown)
                        .padding(.horizontal, 40)
                        .padding(.top, 30)
                    
                    
                    Spacer()
                    
                    // To next build profile prompts!
                    NavigationLink {
                        PhoneInputView()
                            .environmentObject(modelData)
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
        BeginBuildView()
            .environmentObject(ModelData())
    }
}

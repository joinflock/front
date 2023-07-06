//
//  IdentityView.swift
//  flock
//
//  Created by James Zhang on 7/6/23.
//

import SwiftUI

struct IdentityView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack (alignment: .center){
            
            Image("BuildProfile_blurPhoto")
                .padding(.bottom, -125)
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
                        .padding(.top, 75)
                    
                    CustomInputField(imageName: "circle", placeholderText: "gender", text: $modelData.profile.gender)
                        .padding(.horizontal, 40)
                        .padding(.top, 40)
                    
                    CustomInputField(imageName: "circle", placeholderText: "ethnicity", text: $modelData.profile.ethnicity)
                        .padding(.horizontal, 40)
                        .padding(.top, 30)
                    
                    CustomInputField(imageName: "circle", placeholderText: "affinities", text: $modelData.profile.affiniites)
                        .padding(.horizontal, 40)
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    Group {
                        Text("your information is safe with us. view our ") +
                        Text("privacy policy").underline() +
                        Text(" .")
                    }
                    .multilineTextAlignment(.center)
                    .font(.poppins(.regular, size: 12))
                    .padding(.bottom, 15)
                    
                    
                    // To next build profile prompts!
                    NavigationLink {
                        IdentityView()
                            .environmentObject(modelData)
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
        IdentityView()
            .environmentObject(ModelData())
    }
}

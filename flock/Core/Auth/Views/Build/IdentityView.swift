//
//  IdentityView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/22/23.
//

import SwiftUI

struct IdentityView: View {
    @State private var gender = ""
    @State private var ethnicity = ""
    @State private var affinities = ""
    
    var body: some View {
        
        VStack(alignment: .center) {
            
           
                Image("BuildProfile_blurPhoto")
                    
                
                VStack(spacing: 15) {
                    
                    Text("let's build your profile in 1 minute")
                        .font(.poppins(.semibold))
                        .foregroundColor(Color.theme.text)
                        .padding(.top, 40)
                    
                    
                    CustomInputField(imageName: "circle", placeholderText: "gender", text: $gender)
                    
                    CustomInputField(imageName: "circle", placeholderText: "ethnicity", text: $ethnicity)
                    CustomInputField(imageName: "circle", placeholderText: "affinity groups", text: $affinities)
                    
                    // TODO: figure out why the bottom line isn't there
                    Text("we'll only use this information to find your intersections")
                        .font(.poppins(.regular, size: 12))
                        .foregroundColor(Color.theme.text)
                        .multilineTextAlignment(.center)
                    
                    Button{
                        
                    } label: {
                        Text("next")
                            .font(.poppins(.semibold, size: 18))
                            .frame(width: 280, height: 16)
                    }
                    .buttonStyle(FilledButton())
                    .padding(.top, 100)
                }
                .padding(.horizontal, 60)
            }
            .frame(width: .infinity, height: .infinity)
        
    }
}

struct IdentityView_Previews: PreviewProvider {
    static var previews: some View {
        IdentityView()
    }
}

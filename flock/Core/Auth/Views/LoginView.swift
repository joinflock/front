//
//  LoginView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/20/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        // parent container
        VStack(alignment: .leading) {
            
            VStack(spacing: 15) {
                
                Text("welcome back")
                    .font(.poppins(.semibold))
                    .foregroundColor(Color.theme.text)
                    .padding(.top, 100)
                
                CustomInputField(imageName: "circle", placeholderText: "phone number", text: .constant(""))
                
                Text("log back in using your phone number")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

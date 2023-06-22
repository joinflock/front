//
//  EmailView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/22/23.
//

import SwiftUI

struct EmailView: View {
    @State private var email = ""
    
    var body: some View {
        // parent container
        VStack(alignment: .center) {
            
            VStack(spacing: 15) {
                
                Text("what's your email?")
                    .font(.poppins(.semibold, size: 20))
                    .foregroundColor(Color.theme.text)
                    .padding(.top, 100)
                
                CustomInputField(imageName: "circle", placeholderText: "email address", text: $email)
                
                Text("we won't share your email, we promise ;)")
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

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}

//
//  NameView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/22/23.
//

import SwiftUI

struct NameView: View {
    @State private var first_name = ""
    @State private var last_name = ""
    
    var body: some View {
        // parent container
        VStack(alignment: .center) {
            
            VStack(spacing: 15) {
                
                Text("what's your name?")
                    .font(.poppins(.semibold))
                    .foregroundColor(Color.theme.text)
                    .padding(.top, 100)
                
                CustomInputField(imageName: "circle", placeholderText: "first name", text: $first_name)
                CustomInputField(imageName: "circle", placeholderText: "last name", text: $last_name)
                
                Text("use your real name so people know \n who you are!")
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
                .padding(.top, 200)
            }
            .padding(.horizontal, 60)
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}

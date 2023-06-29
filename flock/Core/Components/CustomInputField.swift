//
//  CustomInputField.swift
//  flock
//
//  Created by Jack O'Donnell on 6/20/23.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    
    var body: some View {
        VStack {
        
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.theme.accent)
                
                TextField(placeholderText, text: $text)
                    .padding(.leading, 10)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 0.7)
                    .frame(height: 40)
            )
            
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomInputField(imageName: "circle",
                         placeholderText: "email",
                         text: .constant(""))
    }
}

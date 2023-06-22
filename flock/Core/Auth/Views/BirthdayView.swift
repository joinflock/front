//
//  BirthdayView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/22/23.
//

import SwiftUI

struct BirthdayView: View {
    @State private var birthday = ""
    
    var body: some View {
        // parent container
        VStack(alignment: .center) {
            
            VStack(spacing: 15) {
                
                Text("when's your birthday?")
                    .font(.poppins(.semibold, size: 20))
                    .foregroundColor(Color.theme.text)
                    .padding(.top, 100)
                
                CustomInputField(imageName: "circle", placeholderText: "mm / dd / yy", text: $birthday)
                    .padding([.leading, .trailing], 32)
                
                Text("flock is for 17+ only")
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

struct BirthdayView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayView()
    }
}

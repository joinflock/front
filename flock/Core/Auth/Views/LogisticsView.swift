//
//  LogisticsView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/22/23.
//

import SwiftUI

struct LogisticsView: View {
    @State private var university = ""
    @State private var langs = ""
    @State private var hometown = ""
    
    var body: some View {
        // parent container
        VStack(alignment: .center) {
            
            VStack(spacing: 15) {
                
                Text("we'd hate to waste your time")
                    .font(.poppins(.semibold))
                    .foregroundColor(Color.theme.text)
                    .padding(.top, 100)
                    .multilineTextAlignment(.center)
                ( Text("let's ")
                    .font(.poppins(.medium, size: 20)) +
                  Text("build your profile ")
                    .font(.poppins(.medium, size: 20))
                    .foregroundColor(Color.theme.accent) +
                  Text("in less than two minutes")
                    .font(.poppins(.medium, size: 20)) )
                .multilineTextAlignment(.center)
                
                
            }
            .padding()
//                CustomInputField(imageName: "circle", placeholderText: "university", text: $university)
//                    .padding(.top, 30)
//                CustomInputField(imageName: "circle", placeholderText: "spoken languages", text: $langs)
//                CustomInputField(imageName: "circle", placeholderText: "hometown", text: $hometown)
//
//                Text("we'll only use this information to \n find your intersections!")
//                    .font(.poppins(.regular, size: 12))
//                    .foregroundColor(Color.theme.text)
//                    .multilineTextAlignment(.center)
//
//                Button{
//
//                } label: {
//                    Text("next")
//                        .font(.poppins(.semibold, size: 18))
//                        .frame(width: 280, height: 16)
//                }
//                .buttonStyle(FilledButton())
//                .padding(.top, 100)
//            }
//            .padding(.horizontal, 60)
                
        }
    }
}

struct LogisticsView_Previews: PreviewProvider {
    static var previews: some View {
        LogisticsView()
    }
}

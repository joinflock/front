//
//  LoginView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/20/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var session: SessionManager
    @State var phoneNumber: String
    
    var body: some View {
        GeometryReader { geometry in

        VStack(alignment: .center) {
            
            Text("welcome back!")
                .font(.system(size: 30, weight: .semibold))                .foregroundColor(Color.theme.text)
                .padding(.top, geometry.size.height * 0.30)
                .padding(.bottom, geometry.size.height * 0.1)

            
            
            // .constant for now.... need something to take in and check with database
            CustomInputField(imageName: "circle", placeholderText: "phone number", text: $phoneNumber)
                .keyboardType(.phonePad)
                .padding(.bottom, geometry.size.height * 0.02)

            
            
            Text("log back in using your phone number")
                .font(.system(size: 16, weight: .regular))                .foregroundColor(Color.theme.text)
            
            Spacer()
            
            Button{
                session.signIn()
            } label: {
                Text("login")
                    .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)
                    .font(.system(size: 20, weight: .semibold))
            }
            .buttonStyle(FilledButton())
            .offset(y: -(geometry.size.height * 0.09))
            
        }
        .padding(.horizontal, geometry.size.width * 0.1)

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(phoneNumber: "")
            .environmentObject(SessionManager())
    }
}

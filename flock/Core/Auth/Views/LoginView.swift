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
   
        VStack(alignment: .center, spacing: 15) {
                
            Text("welcome back")
                    .font(.poppins(.semibold))
                    .foregroundColor(Color.theme.text)
                    .padding(.top, 100)
                    .padding(.bottom, 10)
            
                // .constant for now.... need something to take in and check with database
                CustomInputField(imageName: "circle", placeholderText: "phone number", text: $phoneNumber)
                    .padding(.bottom, 10)
                    .keyboardType(.phonePad)
                    
                
                Text("log back in using your phone number")
                    .font(.poppins(.regular, size: 12))
                    .foregroundColor(Color.theme.text)
                
                Button{
                    session.signIn()
                } label: {
                    Text("login")
                        .font(.poppins(.semibold, size: 18))
                        .frame(width: 280, height: 16)
                }
                .buttonStyle(FilledButton())
                .padding(.top, 200)
                .padding(.bottom, 60)
           
            }
            .padding(.horizontal, 60)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(phoneNumber: "")
            .environmentObject(SessionManager())
    }
}

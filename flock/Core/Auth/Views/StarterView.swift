//
//  StarterView.swift
//  flock
//
//  Created by James Zhang on 6/28/23.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var session: SessionManager

    
    var body: some View {
        
        ZStack {
            VStack{
                // Logo & tagline
                Text("flock")
                    .font(.poppins(.bold, size: 40))
                Text("find your people.")
                    .font(.poppins(.medium, size: 20))
                    .padding(.bottom, 150)
            }
            
            VStack{
                Spacer()
                
                NavigationLink {
                    OnboardingView()
                } label: {
                    Text("get started")
                        .frame(width: 280, height: 16)
                        .font(.poppins(.semibold, size: 18))
                }
                .buttonStyle(FilledButton())
                .padding(.bottom, 5)
                
                NavigationLink {
                    LoginView()
                        .environmentObject(session)
                } label: {
                    Text("login")
                        .font(.poppins(.semibold, size: 18))
                        .frame(width: 280, height: 16)
                }
                .buttonStyle(OutlinedButton())
                .padding(.bottom, 5)
                
                
                Text("by creating an account, you are agreeing to \n our [terms and conditions](https://www.google.com) and [privacy policy](https://www.google.com)")
                    .padding(.bottom, 40)
                    .font(.poppins(.light, size: 10))
            }
            .padding(.bottom, 20)
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(SessionManager())
    }
}

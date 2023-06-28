//
//  StarterView.swift
//  flock
//
//  Created by James Zhang on 6/28/23.
//

import SwiftUI

struct StarterView: View {
    var body: some View {
        ZStack {
            VStack{
                // Logo & tagline
                Text("flock")
                    .font(.poppins(.bold, size: 40))
                Text("find your people.")
                    .font(.poppins(.medium, size: 20))
                    .padding(.bottom, 200)
            }
            
            VStack{
                Spacer()
                
                NavigationLink {
                    NameView()
                } label: {
                    Text("get started")
                        .frame(width: 280, height: 16)
                        .font(.poppins(.semibold, size: 18))
                }
                .buttonStyle(FilledButton())
                .padding(.bottom, 5)
                
                
                NavigationLink {
                    LoginView()
                } label: {
                    Text("login")
                        .font(.poppins(.semibold, size: 18))
                        .frame(width: 280, height: 16)
                }
                .buttonStyle(OutlinedButton())
            }
            .padding(.bottom, 200)
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}

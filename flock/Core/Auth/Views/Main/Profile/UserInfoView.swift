//
//  UserInfoView.swift
//  flock
//
//  Created by James Zhang on 7/19/23.
//

import SwiftUI

struct UserInfoView: View {
    let personalIdentity : [String]
    let languages : [String]
    let interests : [String]
    let height : CGFloat
    
    var body: some View {
            
            VStack (alignment: .leading){
                Text("Personal/Identity")
                    .padding(.top, height/30)
                    .font(.poppins(.regular, size: height/45))
                    .foregroundColor(Color.gray)
                
                ButtonsDisplay(list: personalIdentity)
                
                Text("Languages Spoken")
                    .padding(.top, height/30)
                    .font(.poppins(.regular, size: height/45))
                    .foregroundColor(Color.gray)
                
                ButtonsDisplay(list: languages)
                
                Text("Interests")
                    .padding(.top, height/30)
                    .font(.poppins(.regular, size: height/45))
                    .foregroundColor(Color.gray)
                
                ButtonsDisplay(list: interests)
            }
        }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            UserInfoView(personalIdentity: ["Germany", "Male", "Asian", "Princeton University"], languages: ["English", "German", "French"],
                         interests: ["Basketball", "Software Development", "Art", "Beaches", "Media", "Music"], height: geometry.size.height)
        }
    }
}

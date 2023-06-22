//
//  WelcomeView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/22/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("welcome to \n flock")
                .font(.poppins(.bold, size: 40))
                .multilineTextAlignment(.center)
            Text("swipe to build your profile")
                .font(.poppins(.regular, size: 18))
                .foregroundColor(Color.theme.accent)
                .padding(.top, 120)
            
            //TODO: add arrows here
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

//
//  PreferencesView.swift
//  flock
//
//  Created by James Zhang on 7/7/23.
//

import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack (alignment: .center) {
            
            Image("BuildProfile_blurPhoto")
                .padding(.bottom, -125)
                .padding(.top, -20)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 0.3)
                    )
                
                VStack {
                    Group {
                        Text("what matters to you ") +
                        Text("matters").underline() +
                        Text(" to us.")
                    }
                    .font(.poppins(.semibold, size: 25))
                    .padding(.top, 50)
                    .padding(.horizontal, 40)
                    .multilineTextAlignment(.center)
                    
                    
                    Spacer()
                    
                    Text("this will help us find better intersections for you!")
                        .multilineTextAlignment(.center)
                        .font(.poppins(.regular, size: 12))
                        .padding(.bottom, 15)
                        .padding(.horizontal, 40)
                    
                    // To next build profile prompts!
                    NavigationLink {
                        PictureUploadView()
                            .environmentObject(modelData)
                    } label: {
                        Text("next")
                            .frame(width: 280, height: 16)
                            .font(.poppins(.semibold, size: 18))
                    }
                    .buttonStyle(FilledButton())
                    .padding(.bottom, 30)
                    
                    ProgressView(value: 0.90)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 70)
                    
                }
            }
            
        }
        .ignoresSafeArea()
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
            .environmentObject(ModelData())
    }
}

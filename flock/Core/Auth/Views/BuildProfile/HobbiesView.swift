//
//  HobbiesView.swift
//  flock
//
//  Created by James Zhang on 7/7/23.
//

import SwiftUI

struct HobbiesView: View {
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
                    Text("hobbies")
                        .font(.poppins(.semibold, size: 25))
                        .padding(.top, 50)
                    
                    Spacer()
                    
                    Text("what do you like to do in your free time?")
                        .multilineTextAlignment(.center)
                        .font(.poppins(.regular, size: 12))
                        .padding(.bottom, 15)
                        .padding(.horizontal, 40)
                    
                    // To next build profile prompts!
                    NavigationLink {
                        PreferencesView()
                            .environmentObject(modelData)
                    } label: {
                        Text("next")
                            .frame(width: 280, height: 16)
                            .font(.poppins(.semibold, size: 18))
                    }
                    .buttonStyle(FilledButton())
                    .padding(.bottom, 30)
                    
                    ProgressView(value: 0.70)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 70)
                
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct HobbiesView_Previews: PreviewProvider {
    static var previews: some View {
        HobbiesView()
            .environmentObject(ModelData())
    }
}

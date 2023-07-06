//
//  OnboardingVerificationView.swift
//  flock
//
//  Created by James Zhang on 6/30/23.
//

import SwiftUI

struct OnboardingVerificationView: View {
    
    @EnvironmentObject var modelData : ModelData
    
    // Modify here to get some random each time for a specific phone number.
    @State private var code : String = ""
    
    var body: some View {
        VStack (alignment: .center, spacing: 15) {
            Text("verify your number")
                .font(.poppins(.semibold))
                .foregroundColor(Color.theme.text)

            
            Text("check your phone, we sent you a code ;)")
                .font(.poppins(.regular, size: 12))
                .padding(.bottom, 50)
            
            TextField("verification code", text: $code)
                .multilineTextAlignment(.center)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.theme.accent, lineWidth: 0.7)
                        .frame(height: 40)
                )
                .padding(.horizontal, 60)
                .padding(.bottom, 10)
                .keyboardType(.decimalPad)
            
            Text("didn't receive a code? resend in 1:00")
                .font(.poppins(.regular, size: 12))
                .foregroundColor(Color.theme.text)
                .multilineTextAlignment(.center)
                .padding(.bottom, 50)
            
            // Finish.
            NavigationLink {
<<<<<<< Updated upstream
                BeginBuildView()
                    .environmentObject(modelData)
=======
                handleFormSubmit()
>>>>>>> Stashed changes
            } label: {
                Text("verify")
                    .frame(width: 280, height: 16)
                    .font(.poppins(.semibold, size: 18))
            }
            .buttonStyle(FilledButton())
            .padding(.top, 80)
        }
        
    }
    
    func handleFormSubmit() {
        
        
    }
}

struct OnboardingVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingVerificationView()
            .environmentObject(ModelData())
    }
}

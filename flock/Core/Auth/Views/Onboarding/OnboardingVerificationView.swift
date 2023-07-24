//
//  OnboardingVerificationView.swift
//  flock
//
//  Created by James Zhang on 6/30/23.
//

import SwiftUI

struct OnboardingVerificationView: View {
    
    // Modify here to get some random each time for a specific phone number.
    @State private var code : String = ""
    
    let action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in

        VStack (alignment: .center) {
            Text("verify your number")
                .font(.system(size: 35, weight: .semibold))                .foregroundColor(Color.theme.text)
                .padding(.top, geometry.size.height * 0.25)
                .padding(.bottom, geometry.size.height * 0.01)

            
            
            
            Text("check your phone, we sent you a code ;)")
                .font(.system(size: 16, weight: .regular))
                .padding(.bottom, geometry.size.height * 0.075)

            TextField("verification code", text: $code)
                .multilineTextAlignment(.center)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.theme.accent, lineWidth: 1)
                        .frame(height: geometry.size.height*0.05)
                )
                .padding(.bottom, geometry.size.height*0.02)
                .keyboardType(.decimalPad)
            
            Text("didn't receive a code? resend in 1:00")
                .font(.system(size: 16, weight: .regular))          .foregroundColor(Color.theme.text)
                .multilineTextAlignment(.center)
                .padding(.bottom, geometry.size.height*0.01)
            Spacer()
            // Finish.
            Button {
                action()
            } label: {
                Text("verify")
                    .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)
                .font(.system(size: 20, weight: .semibold))                   }
            .buttonStyle(FilledButton())
            .offset(y: -(geometry.size.height * 0.09))
        }
        .padding(.horizontal, geometry.size.width * 0.1)

    }
    }
}

struct OnboardingVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingVerificationView() {}
    }
}

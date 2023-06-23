//
//  VerificationView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/23/23.
//

import SwiftUI

struct VerificationView: View {
    @StateObject var otpModel: OTPViewModel = .init()
    
    var body: some View {
        VStack {
            OTPField()
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Verification")
        
       
    }
    
    // Custom OTP TextField
    @ViewBuilder
    func OTPField()->some View{
        HStack(spacing: 14) {
            ForEach(0..<6, id: \.self) {index in
                VStack(spacing: 8) {
                    TextField("", text: $otpModel.otpFields[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .frame(height: 4)
                }
                .frame(width: 40)
            }
        }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}

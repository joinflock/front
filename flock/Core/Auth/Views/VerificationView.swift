//
//  VerificationView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/23/23.
//

import SwiftUI

struct VerificationView: View {
    @StateObject var otpModel: OTPViewModel = .init()
    // TextField FocusState
    @FocusState var activeField: OTPField?
    var body: some View {
        VStack {
            OTPField()
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Verification")
        .onChange(of: otpModel.otpFields) { newValue in
            OTPCondition(value: newValue)
        }
        
       
    }
    
    // Conditions for Custom OTP Field & Limiting only one text
    func OTPCondition(value: [String]){
        for index in 0..<4 {
            if value[index].count > 1 {
                otpModel.otpFields[index] = String(value[index].last!)
            }
        }
    }
    
    // Custom OTP TextField
    @ViewBuilder
    func OTPField()->some View{
        HStack(spacing: 14) {
            ForEach(0..<4, id: \.self) {index in
                VStack(spacing: 8) {
                    TextField("", text: $otpModel.otpFields[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .focused($activeField, equals: activeStateForIndex(index: index))
                    
                    Rectangle()
                        .fill(activeField == activeStateForIndex(index: index) ? Color.theme.accent : Color.theme.grey.opacity(0.6))
                        .frame(height: 4)
                }
                .frame(width: 40)
            }
        }
    }
    
    func activeStateForIndex(index: Int) -> OTPField {
        switch index {
        case 0: return .field1
        case 1: return .field2
        case 2: return .field3
        case 3: return .field4
        case 4: return .field5
        default: return .field6
        }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}

// FocusState Enum
enum OTPField {
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
}

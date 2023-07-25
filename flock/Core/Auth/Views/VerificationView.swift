////
////  VerificationView.swift
////  flock
////
////  Created by Jack O'Donnell on 6/23/23.
////
//
//import SwiftUI
//
//struct VerificationView: View {
//    @StateObject var otpModel: OTPViewModel = .init()
//    // TextField FocusState
//    @FocusState var activeField: OTPField?
//    var body: some View {
//        VStack(alignment: .center, spacing: 10) {
//            Text("verify your number")
//                .font(.poppins(.semibold, size: 30))
//                .padding(.top, 200)
//                
//            Text("enter the verification code sent to you")
//                .font(.poppins(.regular, size: 16))
//            OTPField()
//                .padding(.top, 30)
//            
//            Text("didn't receive a verification code? [resend in 1:00](https://www.google.com)")
//                .font(.poppins(.light, size: 13))
//                .padding(.top, 20)
//        }
//        .padding()
//        .frame(maxHeight: .infinity, alignment: .top)
//        .navigationTitle("Verification")
//        .onChange(of: otpModel.otp) { newValue in
//            OTPCondition(value: newValue)
//        }
//        
//       
//    }
//    
//    // Conditions for Custom OTP Field & Limiting only one text
//    func OTPCondition(value: [String]){
//        for index in 0..<4 {
//            if value[index].count > 1 {
//                otpModel.otpFields[index] = String(value[index].last!)
//            }
//        }
//    }
//    
//    // Custom OTP TextField
//    @ViewBuilder
//    func OTPField()->some View{
//        HStack(spacing: 14) {
//            ForEach(0..<4, id: \.self) {index in
//                VStack(spacing: 8) {
//                    TextField("", text: $otpModel.otpFields[index])
//                        .keyboardType(.numberPad)
//                        .textContentType(.oneTimeCode)
//                        .multilineTextAlignment(.center)
//                        .focused($activeField, equals: activeStateForIndex(index: index))
//                    
//                    Rectangle()
//                        .fill(activeField == activeStateForIndex(index: index) ? Color.theme.accent : Color.theme.grey.opacity(0.6))
//                        .frame(height: 4)
//                }
//                .frame(width: 40)
//            }
//        }
//    }
//    
//    func activeStateForIndex(index: Int) -> OTPField {
//        switch index {
//        case 0: return .field1
//        case 1: return .field2
//        case 2: return .field3
//        default: return .field4
//
//        }
//    }
//}
//
//struct VerificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        VerificationView()
//    }
//}
//
//// FocusState Enum
//enum OTPField {
//    case field1
//    case field2
//    case field3
//    case field4
//}


import SwiftUI

struct VerificationView: View {
    @StateObject var otpModel: OTPViewModel = .init()
    // TextField FocusState
    @FocusState var activeField: OTPField?
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Text("verify your number")
                    .font(.system(size: 35, weight: .semibold))
                    .padding(.top, geometry.size.height * 0.25)
                    .padding(.bottom, geometry.size.height * 0.005)

                Text("enter the verification code sent to you")
                    .font(.system(size: 16, weight: .regular))
                    .padding(.bottom, geometry.size.height * 0.1)
                
                    OTPField()
                    

                Text("didn't receive a verification code? [resend in 1:00](https://www.google.com)")
                    .font(.system(size: 14, weight: .light))
                .padding(.top, geometry.size.height * 0.03)        }
        .padding(.horizontal, geometry.size.width * 0.1)
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Verification")
        .onChange(of: otpModel.otpFields) { newValue in
            OTPCondition(value: newValue)
        }
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
        default: return .field4

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
}


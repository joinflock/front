//
//  OTPViewModel.swift
//  flock
//
//  Created by Jack O'Donnell on 6/23/23.
//

import SwiftUI

final class OTPViewModel: ObservableObject {
    
    @Published var otp: String = ""
    
    func postOtp() {
        
        let encoder = JSONEncoder()
        let data = try? encoder.encode(otp)
        
        Network.shared.request(methodType: .POST(data: data), "accounts/login/", type: String.self) { res in
            DispatchQueue.main.async {
                switch res {
                    
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}



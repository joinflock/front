//
//  OTPViewModel.swift
//  flock
//
//  Created by Jack O'Donnell on 6/23/23.
//

import SwiftUI

class OTPViewModel: ObservableObject {
    @Published var otpFields: [String] = Array(repeating: "", count: 4)
}

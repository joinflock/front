//
//  Color.swift
//  flock
//
//  Created by Jack O'Donnell on 6/21/23.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let grey = Color("LightGreyColor")
    let text = Color("TextColor")
    
}

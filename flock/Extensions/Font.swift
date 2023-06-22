//
//  Font.swift
//  flock
//
//  Created by Jack O'Donnell on 6/22/23.
//

import Foundation
import SwiftUI

extension Font {
    enum PoppinsFont {
        case semibold, regular, bold, light, medium
        case custom(String)
        
        var value: String {
            switch self {
            case .semibold:
                return "Poppins-SemiBold"
            case .regular:
                return "Poppins-Regular"
            case .bold:
                return "Poppins-Bold"
            case .light:
                return "Poppins-Light"
            case .medium:
                return "Poppins-Medium"
            case .custom(let name):
                return name
            }
        }
    }
    
    static func poppins(_ type: PoppinsFont, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
    
}

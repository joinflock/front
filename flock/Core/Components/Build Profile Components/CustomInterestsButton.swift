//
//  CustomInterestsButton.swift
//  flock
//
//  Created by James Zhang on 7/11/23.
//

import SwiftUI

struct CustomInterestsButton: View {
    @State private var selected = false
    var text : String
    let action: () -> Void
    
    var body: some View {
            Button (action: {
                selected = !selected
                action()
            }
            ) {
                Text(text)
                    .padding(10)
                    .foregroundColor(.black)
                    .font(.poppins(.regular, size: 16))
            }
            .background (
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(selected ? Color.theme.accent.opacity(0.3) : Color.white.opacity(0))
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.theme.accent, lineWidth: 0.5)
                }
            )
            
    }
}

struct CustomInterestsButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomInterestsButton(text: "Test Button", action: {})
    }
}

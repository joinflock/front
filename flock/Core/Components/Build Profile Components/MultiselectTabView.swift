//
//  MultiselectTabView.swift
//  flock
//
//  Created by James Zhang on 7/17/23.
//

import SwiftUI

struct MultiselectTabView: View {
    @State private var isSelected = false
    let text : String
    
    @Binding var otherInput : String
    
    var body: some View {
        VStack {
            Button(action: {isSelected = !isSelected}, label: {
                HStack {
                    Text(text)
                        .foregroundColor(Color.black)
                    Spacer()
                    Image(systemName: isSelected ? "checkmark.square" : "square")
                }
            })
            
            // Once given other option, users can input something more personal.
            if text == "other" && isSelected {
                CustomInputField(imageName: "circle", placeholderText: "ethnicity", text: $otherInput)
                    .padding(.vertical, 10)
            }
        }
    }
}

struct MultiselectTabView_Previews: PreviewProvider {
    static var previews: some View {
        MultiselectTabView(text: "Other", otherInput: .constant("ethnicity"))
    }
}

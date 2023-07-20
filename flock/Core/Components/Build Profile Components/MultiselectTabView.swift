//
//  MultiselectTabView.swift
//  flock
//
//  Created by James Zhang on 7/17/23.
//

import SwiftUI

struct MultiselectTabView: View {

    let text : String
    var isSelected: Bool = false
    
//    @Binding var otherInput: String
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: self.action) {
                HStack {
                    Text(text)
                        .foregroundColor(Color.black)
                    Spacer()
                    Image(systemName: self.isSelected ? "checkmark.square" : "square")
                }
            }
            
//            // Once given other option, users can input something more personal.
//            if text == "other" && self.isSelected {
//                CustomInputField(imageName: "circle", placeholderText: "ethnicity", text: $otherInput)
//                    .padding(.vertical, 10)
//            }
        }
    }
}

struct MultiselectTabView_Previews: PreviewProvider {
    static var previews: some View {
        MultiselectTabView(text: "Other") {}
    }
}

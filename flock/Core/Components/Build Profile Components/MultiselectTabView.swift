//
//  MultiselectTabView.swift
//  flock
//
//  Created by James Zhang on 7/17/23.
//

import SwiftUI

struct MultiselectTabView: View {

    let text : String
    @State var isSelected: Bool = false
    let index: Int
    @Binding var arr: [Bool]
    
//    @Binding var otherInput: String
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                isSelected.toggle()
                self.arr[index] = !self.arr[index]
            }, label: {
                HStack {
                    Text(text)
                        .foregroundColor(Color.black)
                    Spacer()
                    Image(systemName: self.isSelected ? "checkmark.square" : "square")
                }
            })
            
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
        MultiselectTabView(text: "Other", index: 0, arr: .constant([])) {}
    }
}

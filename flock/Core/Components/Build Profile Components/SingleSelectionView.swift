//
//  SingleSelectionView.swift
//  flock
//
//  Created by James Zhang on 7/17/23.
//

import SwiftUI

struct SingleSelectionView: View {
    
    let selection : String
    @Binding var selected : String?
    
    @Binding var otherInput: String
    
    var body: some View {
        VStack {
            Button (action: {self.selected = self.selection}, label:{
                HStack {
                    Text(selection)
                        .foregroundColor(Color.black)
                    Spacer()
                    Image(systemName: (selection == selected) ? "circle.circle.fill" : "circle")
                }
            })
            // Once given other option, users can input something more personal.
            if selection == "other" && selection == selected {
                CustomInputField(imageName: "circle", placeholderText: "gender", text: $otherInput)
                    .padding(.vertical, 10)
            }
        }
        
    }
}

struct SingleSelectionView_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State private var selected : String?
        @State private var otherInput : String = ""
        
        var body :some View {
            SingleSelectionView(selection: "other", selected: $selected, otherInput: $otherInput)
        }
    }
}

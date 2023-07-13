//
//  AutoCustomInputField.swift
//  flock
//
//  Created by James Zhang on 7/13/23.
//

import SwiftUI

struct AutoCustomInputField: View {
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    
    // For autocomplete/suggestions.
    @State private var popupPresented = false
    
    var body: some View {
        VStack {
        
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.theme.accent)
                
                TextField(placeholderText, text: $text)
                    .padding(.leading, 10)
                    .onChange(of: text, perform: { newTag in
                        popupPresented = true
                    })
                    .popover(isPresented: $popupPresented, arrowEdge: .bottom) {
                        let test = ["ab", "a", "asdf", "fad"]
                        
                        VStack (alignment: .leading, spacing: 4){
                            ForEach(test, id: \.self) { suggestion in
                                Button {
                                    text = suggestion
                                } label: {
                                    Label(suggestion, systemImage: "someIcon")
                                }
                                .buttonStyle(.borderless)
                            }
                        }

                    }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 0.7)
                    .frame(height: 40)
            )
            
        }
    }
}

struct AutoCustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        AutoCustomInputField(imageName: "circle",
                             placeholderText: "email",
                             text: .constant("a"))
    }
}

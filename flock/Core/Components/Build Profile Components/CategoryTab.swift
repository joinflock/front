//
//  CategoryTab.swift
//  flock
//
//  Created by James Zhang on 7/7/23.
//

import SwiftUI

// Used in draggable preference screen in build profile. 
struct CategoryTab: View {
    var text : String
    
    var body: some View {
        HStack {
            Group{
                Image("Dragable")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 40)

                Text(text)
                    .font(.poppins(.regular, size: 17))

                Spacer()
            }
            .offset(x: 15)
            .padding(.vertical, 10)
            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.theme.grey, lineWidth: 1.5)
        )
    }
}

struct CategoryTab_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTab(text: "bob")
    }
}

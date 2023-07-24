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
                VStack(spacing: 4){
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:20, height: 2)
                        .foregroundColor(Color.theme.grey)
                        .shadow(color: (Color.theme.grey), radius: 1.5, x: 0, y: 0)

                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:20, height: 2)
                        .foregroundColor(Color.theme.grey)
                        .shadow(color: (Color.theme.grey), radius: 1.5, x: 0, y: 0)

                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:20, height: 2)
                        .foregroundColor(Color.theme.grey)
                        .shadow(color: (Color.theme.grey), radius: 1.5, x: 0, y: 0)

                    
                }
                
                
                    .padding(.vertical, 15)
                    .padding(.leading, 0)

                Text(text)
                    .font(.poppins(.regular, size: 16))
                    .padding(.vertical,20)
                    .padding(.leading, 5)

                Spacer()
            }
            .offset(x: 20)
            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.theme.grey, lineWidth: 2)
                .padding(.vertical, 4)
                .shadow(color: (Color.theme.grey), radius: 1.5, x: 0, y: 0)
                //.shadow(color: (Color.theme.grey), radius: 1, x: 0, y: 0)

            
                
        )
    }
}

struct CategoryTab_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTab(text: "bob")
    }
}



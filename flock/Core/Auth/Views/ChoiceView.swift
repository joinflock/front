//
//  ChoiceView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/22/23.
//

import SwiftUI

struct ChoiceView: View {
    var body: some View {
        VStack(alignment: .center) {
            
            Text("flock")
                .font(.poppins(.bold, size: 40))
                .padding(.top, 200)
            Text("find your people.")
                .font(.poppins(.medium, size: 20))
                .padding(.top, -45)
            
            Spacer()
            
            Button{
                    
                } label: {
                    Text("get started")
                        .font(.poppins(.semibold, size: 18))
                        .frame(width: 200, height: 16)
                }
                .buttonStyle(FilledButton())
            Button{
                    
                } label: {
                    Text("login")
                        .font(.poppins(.semibold, size: 18))
                        .frame(width: 200, height: 16)
                }
                .buttonStyle(OutlinedButton())
                .padding(.bottom, 30)
            
            // TODO: update links
            Text("by creating an account, you are agreeing to \n our [terms and conditions](https://www.google.com) and [privacy policy](https://www.google.com)")
                .padding(.bottom, 40)

        }
        .font(.poppins(.light, size: 10))
        
    }
}

struct ChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceView()
    }
}

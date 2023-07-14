//
//  MessagesView.swift
//  flock
//
//  Created by Saarthak Chaturvedi on 7/11/23.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 16) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 24, weight: .heavy))
                    Text("Messages")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                    Image(systemName: "gear")
                }
                .padding()
                
                ScrollView {
                    ForEach(0..<10, id: \.self) {num in
                        VStack {
                            HStack(spacing: 16) {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 32))
                                    .padding(8)
                                    .overlay(RoundedRectangle(cornerRadius: 44)
                                        .stroke(Color.theme.accent, lineWidth: 1))
                                    
                                VStack(alignment: .leading) {
                                    Text("User Name")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("Latest Message")
                                        .font(.system(size: 14))
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Text("2d")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            Divider()
                                .padding(.vertical, 8)
                        } .padding(.horizontal)
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}

//
//  ProfileMidNavBar.swift
//  flock
//
//  Created by James Zhang on 7/19/23.
//

import SwiftUI

struct ProfileMidNavBar: View {
    
    // For dynamic sizing
    var height: CGFloat
    var width: CGFloat
    
    // Tracking which view to show.
    @Binding var onUserInfo : Bool   // default to this
    @Binding var onPaths : Bool
    @Binding var onSettings : Bool
    
    let action: () -> Void
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Button {
                    action()
                    onUserInfo = true
                    onPaths = false
                    onSettings = false
                } label: {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: width/15, height: height/30)
                        .foregroundColor(onUserInfo ? Color.theme.accent : Color.black)
                }
                
                Spacer()
                
                // Can find a better image for this
                Button {
                    action()
                    onUserInfo = false
                    onPaths = true
                    onSettings = false
                } label: {
                    Image(systemName: "app.connected.to.app.below.fill")
                        .resizable()
                        .frame(width: width/15, height: height/30)
                        .foregroundColor(onPaths ? Color.theme.accent : Color.black)
                }
                
                Spacer()
                
                Button {
                    action()
                    onUserInfo = false
                    onPaths = false
                    onSettings = true
                } label: {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: width/15, height: height/30)
                        .foregroundColor(onSettings ? Color.theme.accent : Color.black)
                }
            }
            .padding(.vertical, height/80)
            .padding(.horizontal, width/7.5)
            
            Divider()
                .overlay(
                    Rectangle()
                        .foregroundColor(Color.theme.accent)
                        .padding(
                            (onUserInfo || onPaths) ? (onPaths ? .horizontal : .trailing) : .leading
                                , onPaths ? width/3 : width/(3/2)
                        )
                )
        }
    }
}

struct ProfileMidNavBar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            ProfileMidNavBar(height: geometry.size.height, width: geometry.size.width, onUserInfo: .constant(true), onPaths: .constant(false), onSettings: .constant(false)){}
        }
    }
}

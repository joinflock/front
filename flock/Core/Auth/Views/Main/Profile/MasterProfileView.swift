//
//  MasterProfileView.swift
//  flock
//
//  Created by James Zhang on 7/18/23.
//

import SwiftUI

struct MasterProfileView: View {
    @EnvironmentObject var session : SessionManager
    
    @State private var onUserInfo : Bool = true  // default to this
    @State private var onPaths : Bool = false
    @State private var onSettings : Bool = false
    
    var body: some View {
        
        // Hardcoded for now.
        let start = DateComponents(year: 2023, month: 7, day: 19)
        let end = DateComponents(year: 2023, month: 7, day: 29)
        
        let path1 = Path(locationText: "LOCATION NAME", startTime: Calendar.current.date(from: start) ?? Date(), endTime: Calendar.current.date(from: end) ?? Date(), isCurrent: false)
        let path2 = Path(locationText: "LOCATION NAME", startTime: Calendar.current.date(from: start) ?? Date(), endTime: Calendar.current.date(from: end) ?? Date(), isCurrent: false)
        let path3 = Path(locationText: "LOCATION NAME", startTime: Calendar.current.date(from: start) ?? Date(), endTime: Calendar.current.date(from: end) ?? Date(), isCurrent: true)
        
        let paths = [path1, path2, path3]
        
        GeometryReader { geometry in
            // Dynamic sizes.
            let height = geometry.size.height
            let width = geometry.size.width
            
            VStack (alignment: .center){
                Text("Profile")
                    .padding(.top, height/35)
                    .padding(.leading, width/10)
                    .padding(.bottom, height/600)
                    .font(.poppins(.semibold, size: height/28))
                    .offset(x: -width/3)
                
                Divider()
                    .offset(y: height/100)

                ScrollView {
                    Group{
                        CircleImage(image: Image("defaultUser").resizable())
                            .frame(width: width/(3/1.25), height: height/(7/1.25))
                            .padding(.top, height/25)
                            .padding(.bottom, height/70)
                        
                        // Need to retrieve user data and plug into here!!
                        Text("Bucko Barton, 20")
                            .font(.poppins(.regular, size: height/30))
                            .padding(.bottom, -height/70)
                        
                        Text("bucko.barton@princeton.edu")
                            .font(.poppins(.regular, size: height/45))
                            .foregroundColor(Color.theme.accent)
                            .padding(.bottom, height/55)
                        
                        // Are we having a biography? If so, limit to 100 characters
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc malesuada, tellus vitae ullamcorper")
                            .multilineTextAlignment(.center)
                            .font(.poppins(.regular, size: height/49))
                            .foregroundColor(Color.gray)
                            .padding(.bottom, height/30)
                    }
                    .padding(.horizontal, width/10)
                    
                    ProfileMidNavBar(height: height, width: width, onUserInfo: $onUserInfo, onPaths: $onPaths, onSettings: $onSettings, action: {})
                    
                    if onUserInfo {
                        UserInfoView(personalIdentity: ["Germany", "Male", "Asian", "Princeton University"], languages:  ["English", "German", "French"], interests: ["Basketball", "Software Development", "Art", "Beaches", "Media", "Music"], height: height)
                        .padding(.horizontal, width/10) }
                    else if (onPaths) {
                        ProfilePathView(height: height, width: width, pathsDisplay: paths)
                    }
                    else {
                        SettingsView()
                    }
                }
            }
        }
    }
}

struct MasterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MasterProfileView()
            .environmentObject(SessionManager())
    }
}

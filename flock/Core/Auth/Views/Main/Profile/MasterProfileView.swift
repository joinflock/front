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
    
    let action: () -> Void
    
    var body: some View {
        
        // Hardcoded for now.
        let start1 = DateComponents(year: 2023, month: 6, day: 15)
        let end1 = DateComponents(year: 2023, month: 6, day: 29)
        let start2 = DateComponents(year: 2023, month: 7, day: 10)
        let end2 = DateComponents(year: 2023, month: 7, day: 14)
        let start3 = DateComponents(year: 2023, month: 8, day: 1)
        let end3 = DateComponents(year: 2023, month: 8, day: 29)
        
        let path1 = Path(locationText: "Princeton, NJ", startTime: Calendar.current.date(from: start1) ?? Date(), endTime: Calendar.current.date(from: end1) ?? Date(), isCurrent: false)
        let path2 = Path(locationText: "Long Island, NY", startTime: Calendar.current.date(from: start2) ?? Date(), endTime: Calendar.current.date(from: end2) ?? Date(), isCurrent: false)
        let path3 = Path(locationText: "Los Angeles, CA", startTime: Calendar.current.date(from: start3) ?? Date(), endTime: Calendar.current.date(from: end3) ?? Date(), isCurrent: true)
        
        let paths = [path1, path2, path3]
        
        GeometryReader { geometry in
            // Dynamic sizes.
            let height = geometry.size.height
            let width = geometry.size.width
            
            VStack (alignment: .center){
                HStack {
                    Text("Profile")
                        .padding(.top, height/105)
                        .padding(.leading, width/10)
                        .padding(.bottom, height/600)
                        .font(.poppins(.semibold, size: height/28))
                    
                    Spacer()
                    
                    Button {
                        action()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: width/15, height: height/30)
                            .padding(.trailing, width/10)
                            .foregroundColor(Color.gray)
                    }
                }
                
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
                        ProfilePathView(height: height, width: width, pathsDisplay: paths) {}
                    }
                    else {
                        PrivacyView()
                    }
                }
            }
        }
    }
}

struct MasterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MasterProfileView() {}
            .environmentObject(SessionManager())
    }
}

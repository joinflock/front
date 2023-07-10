//
//  ProfileView.swift
//  flock
//
//  Created by Jack O'Donnell on 7/7/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(SessionManager())
    }
}

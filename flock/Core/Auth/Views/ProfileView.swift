//
//  ProfileView.swift
//  flock
//
//  Created by Jack O'Donnell on 7/7/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var session: SessionManager
    
    @StateObject private var vm: ProfileViewModel
    
    init () {
        _vm = StateObject(wrappedValue: ProfileViewModel())
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello World")
//            Text(vm.profile!.firstName)
//            Text(vm.profile!.lastName)
//            Text(vm.profile!.university)
        }
        .onAppear {
            vm.fetchProfile()
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        
    }
}

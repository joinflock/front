//
//  ProfileViewModel.swift
//  flock
//
//  Created by Jack O'Donnell on 7/17/23.
//

import Foundation


final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var viewState: ViewState?
    @Published private(set) var profile: Profile?
    @Published var hasError = false
    
    
    @MainActor
    func fetchProfile() {
        Network.shared.request("accounts/profile/", type: Profile.self) { [weak self] res in
            switch res {
            case .success(let response):
                self?.profile = response
            case .failure(let error):
                print(error)
            }
        }

    }
}

extension ProfileViewModel {
    enum ViewState {
        case fetching
        case loading
        case finished
    }
}

//private extension PeopleViewModel {
//    func reset() {
//        if viewState == .finished {
//
//        }
//    }
//}

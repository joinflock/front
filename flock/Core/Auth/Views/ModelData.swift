//
//  ModelData.swift
//  flock
//
//  Created by James Zhang on 6/28/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var profile = Profile.default
    
}

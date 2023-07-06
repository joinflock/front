//
//  CreateViewModel.swift
//  flock
//
//  Created by Jack O'Donnell on 7/6/23.
//
import Foundation

final class CreateViewModel: ObservableObject {

    @Published var modelData = ModelData()

    func create() {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode(modelData)

        NetworkingManager
            .shared
            .request(methodType: .POST(data: data),
                     "http://127.0.0.1:8000/signup/", { res in
                
                DispatchQueue.main.async {
                    
                    switch res {
                        
                    case .success:
                        self?.state = .successful
                    case .failure:
                        self?.state = .unsucceessful
                    }
                }
            }
            )
    }
}

extension CreateViewModel {
    enum SubmissionState {
        case unsucceessful
        case successful
    }
}

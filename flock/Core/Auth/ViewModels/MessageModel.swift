//
//  MessageModel.swift
//  flock
//
//  Created by Tadiyos Berhane on 7/24/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var recicived: Bool
    var timestamp: Date
}


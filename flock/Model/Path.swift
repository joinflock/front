//
//  Path.swift
//  flock
//
//  Created by James Zhang on 7/20/23.
//

import Foundation

struct Path: Identifiable {
    var locationText : String
    var startTime : Date
    var endTime : Date
    var isCurrent : Bool
    
    // Should be unique here! 
    var id : String {locationText + startTime.formatted() + endTime.formatted()}
}


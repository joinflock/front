//
//  ProfilePathView.swift
//  flock
//
//  Created by James Zhang on 7/20/23.
//

import SwiftUI

struct ProfilePathView: View {
    // For dynamic resizing.
    let height : CGFloat
    let width : CGFloat
    
    let pathsDisplay : [Path]
    
    var body: some View {
        VStack (alignment: .center) {
            PathStopView(height: height, width: width, pathToDisplay: pathsDisplay[0])
            PathStopView(height: height, width: width, pathToDisplay: pathsDisplay[1])
            PathStopView(height: height, width: width, pathToDisplay: pathsDisplay[2])
        }
    }
}

struct ProfilePathView_Previews: PreviewProvider {
    static var previews: some View {
        let start = DateComponents(year: 2023, month: 7, day: 19)
        let end = DateComponents(year: 2023, month: 7, day: 29)
        
        let path1 = Path(locationText: "LOCATION NAME", startTime: Calendar.current.date(from: start) ?? Date(), endTime: Calendar.current.date(from: end) ?? Date(), isCurrent: false)
        let path2 = Path(locationText: "LOCATION NAME", startTime: Calendar.current.date(from: start) ?? Date(), endTime: Calendar.current.date(from: end) ?? Date(), isCurrent: false)
        let path3 = Path(locationText: "LOCATION NAME", startTime: Calendar.current.date(from: start) ?? Date(), endTime: Calendar.current.date(from: end) ?? Date(), isCurrent: true)
        
        let paths = [path1, path2, path3]
        
        GeometryReader { geo in
            ProfilePathView(height: geo.size.height, width: geo.size.width, pathsDisplay: paths)
        }
    }
}

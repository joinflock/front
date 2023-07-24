//
//  AddPathView.swift
//  flock
//
//  Created by James Zhang on 7/21/23.
//

import SwiftUI

struct AddPathView: View {
    // For dynamic resizing.
    let height : CGFloat
    let width : CGFloat
    
    var body: some View {
        Text("Add Path")
            .font(.poppins(.semibold, size: height/30))
    }
}

struct AddPathView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            AddPathView(height: geo.size.height, width: geo.size.width)
        }
    }
}

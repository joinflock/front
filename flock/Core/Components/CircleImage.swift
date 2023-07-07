//
//  CircleImage.swift
//  flock
//
//  Created by James Zhang on 7/7/23.
//

import SwiftUI

struct CircleImage: View {
    var image : Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("defaultUser"))
    }
}

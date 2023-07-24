//
//  SmallMutualIntersectionsView.swift
//  flock
//
//  Created by James Zhang on 7/24/23.
//

import SwiftUI

struct SmallMutualIntersectionsView: View {
    var height: CGFloat
    var width: CGFloat
    
    var mutuals : [String]      // Should we have Strings or Images stored here?
    
    var body: some View {
        HStack {
            if (mutuals.count < 4) {
                ForEach(mutuals, id: \.self) { img in
                    CircleImage(image: Image(img).resizable())
                        .frame(width: width/8, height: height/20)
                        .padding(.trailing, -width/14)
                }
            }
            else {
                // Take first three.
                CircleImage(image: Image(mutuals[0]).resizable())
                    .frame(width: width/8, height: height/20)
                    .padding(.trailing, -width/14)
                CircleImage(image: Image(mutuals[0]).resizable())
                    .frame(width: width/8, height: height/20)
                    .padding(.trailing, -width/14)
                CircleImage(image: Image(mutuals[0]).resizable())
                    .frame(width: width/8, height: height/20)
                
                
                Text("+" + String(mutuals.count - 3))
                    .font(.poppins(.regular, size: height/40))
                    .foregroundColor(Color.gray)
                    .padding(.leading, -width/45)
            }
        }
    }
}

struct SmallMutualIntersectionsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            VStack {
                SmallMutualIntersectionsView(height: geo.size.height, width: geo.size.width, mutuals: ["defaultUser", "defaultUser", "defaultUser", "defaultUser", "defaultUser", "defaultUser", "defaultUser"])
                
                SmallMutualIntersectionsView(height: geo.size.height, width: geo.size.width, mutuals: ["defaultUser", "defaultUser"])
            }
        }
    }
}

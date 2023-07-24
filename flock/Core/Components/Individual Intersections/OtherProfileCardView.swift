//
//  OtherProfileCardView.swift
//  flock
//
//  Created by James Zhang on 7/24/23.
//

import SwiftUI

struct OtherProfileCardView: View {
    // For dynamic resizing.
    var height: CGFloat
    var width: CGFloat
    
    var name : String
    var age : String   // Make sure to change to String if stored as Int!
    var university: String
    var otherProfileImage : Image
    var sharedInterests : [String]
    var mutualIntersections : [String]
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                CircleImage(image: otherProfileImage.resizable())
                    .frame(width: width/4, height: height/10)
                    .padding(.trailing, width/4)
                
                SmallMutualIntersectionsView(height: height, width: width, mutuals: mutualIntersections)
                    .offset(x: -width/25, y: -width/35)
            }
            .offset(x: width/70)
                
            Group {
                VStack {
                    Text(name + ", ") +
                    Text(age)
                        .bold()
                }
                Text(university)
                    .foregroundColor(Color.theme.accent)
                    .font(.poppins(.regular, size: height/40))
            }
            .font(.poppins(.regular, size: height/30))
            .offset(x: width/90)
            
            if sharedInterests.count > 2 {
                let toDisplay : [String] = [sharedInterests[0], sharedInterests[1]]
                HStack {
                    ButtonsDisplay(list: toDisplay)
                        .offset(x: width/90)
                    
                    Text("+ " + String(sharedInterests.count-2))
                        .font(.poppins(.regular, size: height/40))
                        .foregroundColor(Color.gray)
                        .offset(x: -width/20)
                }
                .padding(.top, -height/95)
            }
            else {
                ButtonsDisplay(list: sharedInterests)
                    .padding(.top, -height/95)
            }
        }
        .padding(.vertical, height/45)
        .padding(.horizontal, width/15)
        .overlay (
            RoundedRectangle(cornerRadius: 40)
                .opacity(0.04)
                .padding(.horizontal, width/30)
        )
    }
}

struct OtherProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            OtherProfileCardView(height: geo.size.height, width: geo.size.width, name: "Bucko Barton", age: "20", university: "Princeton University", otherProfileImage: Image("defaultUser"), sharedInterests: ["Agriculture", "Dancing", "Basketball", "Football", "Fishing"], mutualIntersections: ["defaultUser", "defaultUser","defaultUser","defaultUser","defaultUser"])
        }
    }
}

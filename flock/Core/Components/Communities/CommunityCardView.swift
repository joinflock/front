//
//  CommunityCardView.swift
//  flock
//
//  Created by James Zhang on 7/24/23.
//

import SwiftUI

struct CommunityCardView: View {
    var height: CGFloat
    var width: CGFloat
    
    var communityName : String
    var communityImage : Image
    var isPrivate : Bool
    var categories : [String]
    var peopleIn : [String]
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                CircleImage(image: communityImage.resizable())
                    .frame(width: width/4, height: height/10)
                    .padding(.leading, width/25)
                
                if isPrivate {
                    Text("private")
                        .font(.poppins(.regular, size: height/50))
                        .foregroundColor(Color.white)
                        .offset(x: -width/10)
                        .padding(height/50)
                        .background (
                            RoundedRectangle(cornerRadius: 40)
                                .padding(height/100)
                                .offset(x: -width/10)
                                .background(
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color.white)
                                        .offset(x: -width/10)
                                )
                        )
                }
                else {
                    Text("open")
                        .font(.poppins(.regular, size: height/50))
                        .foregroundColor(Color.white)
                        .offset(x: -width/10)
                        .padding(height/50)
                        .background (
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(Color.theme.accent)
                                .padding(height/100)
                                .offset(x: -width/10)
                                .background(
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color.white)
                                        .offset(x: -width/10)
                                )
                        )
                }
                
                SmallMutualIntersectionsView(height: height, width: width, mutuals: peopleIn)
                    .offset(x: width/20)
            }
            .offset(x: width/70)
                
            Text(communityName)
                .font(.poppins(.regular, size: height/30))
                .padding(.leading, width/12.5)
            
            // Should have at max 3 chosen.
            ButtonsDisplay(list: categories)
                .padding(.top, -height/95)
                .padding(.leading, width/15)
        }
        .padding(.vertical, height/45)
        .overlay (
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(Color.black)
                .opacity(0.04)
                .padding(.horizontal, width/30)
        )
    }
}

struct CommunityCardView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            VStack {
                CommunityCardView(height: geo.size.height, width: geo.size.width, communityName: "AI Sunday Brunch", communityImage: Image("defaultUser"), isPrivate: true, categories: ["Computer Science", "Robots"], peopleIn: ["defaultUser","defaultUser","defaultUser","defaultUser","defaultUser","defaultUser"])
                CommunityCardView(height: geo.size.height, width: geo.size.width, communityName: "AI Sunday Brunch", communityImage: Image("defaultUser"), isPrivate: false, categories: ["Computer Science", "Robots"], peopleIn: ["defaultUser","defaultUser","defaultUser","defaultUser","defaultUser","defaultUser"])
            }
        }
    }
}

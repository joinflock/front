//
//  CommunitiesView.swift
//  flock
//
//  Created by James Zhang on 7/18/23.
//

import SwiftUI

struct CommunitiesView: View {
    var height: CGFloat
    var width: CGFloat

    var communityNames : [String]
    var communityImages : [Image]
    var isPrivate : [Bool]
    var categories : [String]  // Will need to turn into array of string arrays. Kept as one for simplicity for now.
    var peopleIn : [String]

    let action: () -> Void

    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text("communities")
                        .font(.poppins(.semibold, size: height/25))
                        .padding(.leading, width/15)

                    Button {
                        action()
                    } label: {
                        HStack {
                            Text("now")
                                .font(.poppins(.regular, size: height/40))
                                .foregroundColor(Color.gray)
                                .padding(.leading, width/15)
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                Spacer()

                Button {
                    action()
                } label: {
                    Image(systemName: "text.magnifyingglass")
                        .resizable()
                        .frame(width: width/12.5, height: height/25)
                        .foregroundColor(Color.theme.accent)
                        .padding(.trailing, width/15)
                }
                .offset(y: -height/50)
            }
            .padding(.top, height/45)
            .padding(.bottom, height/150)

            Divider()
                .offset(y: height/100)

            ScrollView {
                Spacer()
                    .frame(height: height/35)

                // Hardcoded for now. Will need to finalize how we get these communities to show.

                LazyVStack {
                    ForEach(0...communityNames.count-1, id: \.self) { index in
                        CommunityCardView(height: height, width: width, communityName: communityNames[index], communityImage: communityImages[index], isPrivate: isPrivate[index], categories: categories, peopleIn: peopleIn)
                    }
                    .padding(.vertical, height/150)
                }

                Spacer()
                    .frame(height: height/25)
            }
        }
    }
}

struct CommunitiesView_Previews: PreviewProvider {
    static var previews: some View {
        let communityNames = ["AI Sunday Brunch", "AI Sunday Brunch","AI Sunday Brunch","AI Sunday Brunch","AI Sunday Brunch","AI Sunday Brunch"]
        let communityImages = [Image("defaultUser"),Image("defaultUser"),Image("defaultUser"),Image("defaultUser"),Image("defaultUser"),Image("defaultUser")]
        let peopleIn = ["defaultUser","defaultUser","defaultUser","defaultUser","defaultUser","defaultUser"]
        let isPrivate = [true, false, true, false, false, true]
        let categories = ["Computer Science", "Arts", "Robots"]
        
        GeometryReader { geo in
            CommunitiesView(height: geo.size.height, width: geo.size.width, communityNames: communityNames, communityImages: communityImages, isPrivate: isPrivate, categories: categories, peopleIn: peopleIn) {}
        }
    }
}

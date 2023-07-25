//
//  IndividualView.swift
//  flock
//
//  Created by James Zhang on 7/18/23.
//

import SwiftUI

struct IndividualView: View {
    var height: CGFloat
    var width: CGFloat
    
    // Should be update here with pull requests from database.
    var name : String
    var age : String
    var university : String
    var otherProfileImages : [Image]
    var sharedInterests : [String]
    var mutualIntersections : [String]
    
    let action: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text("intersections")
                        .font(.poppins(.semibold, size: height/25))
                        .padding(.leading, width/15)
                        
                        Button {
                            action()
                        } label : {
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
                    Image(systemName: "line.3.horizontal.decrease.circle")
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
                
                // Hardcoded for now. Will need to finalize how we get these profiles to show.
                LazyVStack {
                    ForEach(0...otherProfileImages.count, id: \.self) { card in
                        OtherProfileCardView(height: height, width: width, name: name, age: age, university: university, otherProfileImage: otherProfileImages[card], sharedInterests: sharedInterests, mutualIntersections: mutualIntersections)
                    }
                    .padding(.vertical, height/150)
                }
                
                Spacer()
                    .frame(height: height/25)
            }
      
        }
    }
}

struct IndividualView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            IndividualView(height: geo.size.height, width: geo.size.width, name: "Bucko Barton", age: "20", university: "Princeton University", otherProfileImages: [Image("defaultUser"), Image("defaultUser"),Image("defaultUser"),Image("defaultUser"),Image("defaultUser"),Image("defaultUser"),Image("defaultUser"),Image("defaultUser"),Image("defaultUser"),Image("defaultUser"),Image("defaultUser")], sharedInterests: ["Agriculture", "Dancing", "Basketball", "Football", "Fishing"], mutualIntersections: ["defaultUser", "defaultUser","defaultUser","defaultUser","defaultUser"]) {}
        }
    }
}

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
    
    let action: () -> Void
    
    var body: some View {
        VStack (alignment: .center) {
            
                Button {
                    action()
                } label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: width/15, height: height/30)
                }
                .offset(x: width/2.65)
                .padding(.top, height/35)
            
            HStack {
                // ASSUMES THAT ARRAY IS DATA MODEL AND MOST RECENT LOCATION IS AT END OF ARRAY (INDEX .COUNT -1)
                Group {
                    Text("currently in: ") + Text(pathsDisplay[pathsDisplay.count-1].locationText)
                        .foregroundColor(Color.theme.accent)
                }
                .multilineTextAlignment(.center)
                
            }
            .font(.poppins(.regular, size: height/40))
            .padding(.bottom, height/55)
            
            
            // Hardcoded for now. Will need do some ForEach once we have more and more stops. 
            Group {
                ZStack {
                    PathStopView(height: height, width: width, pathToDisplay: pathsDisplay[0])
                    
                    Image("rightDown")
                        .resizable()
                        .frame(width: width/6, height: height/5)
                        .offset(x: width/2.4, y: height/14)
                }
                
                
                ZStack {
                    PathStopView(height: height, width: width, pathToDisplay: pathsDisplay[1])
                        .offset(x: 2*width/10)
                    
                    Image("leftDown")
                        .resizable()
                        .frame(width: width/6, height: height/5)
                        .offset(x: -width/4.4, y: height/15)
                }
                
                PathStopView(height: height, width: width, pathToDisplay: pathsDisplay[2])
            }
            .padding(.bottom, height/30)
            .offset(x: -width/10)
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
            ProfilePathView(height: geo.size.height, width: geo.size.width, pathsDisplay: paths) {}
        }
    }
}

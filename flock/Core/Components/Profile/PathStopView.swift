//
//  PathStopView.swift
//  flock
//
//  Created by James Zhang on 7/20/23.
//

import SwiftUI

struct PathStopView: View {
    // For dynamic sizing.
    let height : CGFloat
    let width : CGFloat
    
    // Following 4 variables bundled as struct called Path.
//    var locationText : String
//    var startTime : Date
//    var endTime : Date
//    var isCurrent : Bool
    
    var pathToDisplay : Path
    
    var body: some View {
        VStack (alignment: .leading) {
//            if pathToDisplay.isCurrent {
                HStack {
                    Image(systemName: "bird.fill")
                        .resizable()
                        .frame(width: width/7.5, height: height/15)
                    .offset(x: width/20)
                    
    //                Spacer()
    //
    //                Image(systemName: "line.3.horizontal.circle.fill")
    //                    .resizable()
    //                    .frame(width: width/15, height: height/30)
    //                    .padding(.trailing, width/20)
    //                    .offset(x: -width/85, y: -height/75)
                }
//            }
            
            
            VStack (alignment: .center){
                Text(pathToDisplay.locationText)
                    .font(.poppins(.semibold, size: height/32))
                    .padding(.bottom, height/120)
                    .multilineTextAlignment(.center)
                
                
                HStack {
                    VStack {
                        Text("Start")
                            .foregroundColor(pathToDisplay.isCurrent ? Color.theme.grey : Color.gray)
                        Text(pathToDisplay.startTime.formatted(
                            Date.FormatStyle()
                                .month(.abbreviated)
                                .day(.defaultDigits)))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("End")
                            .foregroundColor(pathToDisplay.isCurrent ? Color.theme.grey : Color.gray)
                        Text(pathToDisplay.endTime.formatted(
                            Date.FormatStyle()
                                .month(.abbreviated)
                                .day(.defaultDigits)))
                    }
                }
                .padding(.horizontal, width/10)
                .font(.poppins(.regular, size: height/45))
            }
        }
        .padding(.horizontal, width/5)
        .padding(.vertical, height/40)
        .background(
            RoundedRectangle(cornerRadius: 50)
                .opacity(pathToDisplay.isCurrent ? 1 : 0.15)
                .foregroundColor(Color.theme.accent)
                .padding(.horizontal, width/6)
        )
        .foregroundColor(pathToDisplay.isCurrent ? Color.white : Color.black)
    }
}

struct PathStopView_Previews: PreviewProvider {
    static var previews: some View {
        let start = DateComponents(year: 2023, month: 7, day: 19)
        let end = DateComponents(year: 2023, month: 7, day: 29)
        let path1 = Path(locationText: "LOCATION NAME", startTime: Calendar.current.date(from: start) ?? Date(), endTime: Calendar.current.date(from: end) ?? Date(), isCurrent: false)
        let path2 = Path(locationText: "LOCATION NAME", startTime: Calendar.current.date(from: start) ?? Date(), endTime: Calendar.current.date(from: end) ?? Date(), isCurrent: true)

        
        GeometryReader { geo in
            VStack {
                PathStopView(height: geo.size.height, width: geo.size.width, pathToDisplay: path1)
                
                PathStopView(height: geo.size.height, width: geo.size.width, pathToDisplay: path2)
            }
        }
    }
}

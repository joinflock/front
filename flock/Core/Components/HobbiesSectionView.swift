//
//  HobbiesSectionView.swift
//  flock
//
//  Created by James Zhang on 7/11/23.
//

import SwiftUI

struct HobbiesSectionView: View {
    var header : String
    var list : [String]
    
    var body: some View {
        VStack {
            Text(header)
            ForEach(0..<list.count) { index in
                CustomInterestsButton(text: list[index], action: {})
            }
        }
    }
}

struct HobbiesSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HobbiesSectionView(header: "Music", list: [
            "Classical",
            "Country",
            "EDM",
            "Hip hop",
            "House",
            "Indie",
            "J-pop",
            "K-pop",
            "Pop",
            "R&B",
            "Rock"
          ])
    }
}

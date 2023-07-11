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
        VStack (alignment: .center){
            Text(header)
                .font(.poppins(.medium, size: 18))
                .padding(.bottom, 15)
            
            // Indexing here hardcoded for 2 choices per row.
            ForEach(0..<list.count) { index in
                if (index % 2 == 0) {
                    HStack {
                        CustomInterestsButton(text: list[index], action: {})
                        
                        if (index + 1 != list.count) {
                            CustomInterestsButton(text: list[index + 1], action: {})
                        }
                    }
                }
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

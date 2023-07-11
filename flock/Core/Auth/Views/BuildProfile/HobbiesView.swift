//
//  HobbiesView.swift
//  flock
//
//  Created by James Zhang on 7/7/23.
//

import SwiftUI

struct HobbiesView: View {
    
    @State private var hobbies = [
        "Music": [
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
        ],
        "Sports": [
          "Badminton",
          "Baseball",
          "Basketball",
          "Bowling",
          "Boxing",
          "Cricket",
          "Cycling",
          "Football",
          "Golf",
          "Hockey",
          "Rock climbing",
          "Running",
          "Sailing",
          "Skateboarding",
          "Skiing",
          "Snowboarding",
          "Surfing",
          "Swimming",
          "Table Tennis",
          "Tennis",
          "Volleyball",
          "Yoga"
        ],
        "Creativity": [
          "Art",
          "Cinematography",
          "Dancing",
          "Film making",
          "Make-up",
          "Photography",
          "Singing",
          "Writing"
        ],
        "Going out": [
          "Bars",
          "Cafe-hopping",
          "Clubs",
          "Concerts",
          "Festivals",
          "Karaoke",
          "Museums",
          "Stand up",
          "Theater"
        ],
        "Staying in": [
          "Baking",
          "Board games",
          "Cooking",
          "Video games"
        ],
        "Films/TV": [
          "Action",
          "Anime",
          "Bollywood",
          "Comedy",
          "Crime",
          "Documentaries",
          "Fantasy",
          "Horror",
          "K-drama",
          "Reality shows",
          "Rom-com",
          "Romance",
          "Superhero"
        ],
        "Food & Drink": [
          "Beer",
          "Boba tea",
          "Coffee",
          "Pizza",
          "Sushi",
          "Tacos",
          "Vegan",
          "Wine"
        ],
        "Traveling": [
          "Backpacking",
          "Beaches",
          "Camping",
          "Fishing",
          "Hiking",
          "Road trips"
        ],
        "Values": [
          "Black Lives Matter",
          "Environmentalism",
          "Feminism",
          "Human rights",
          "LGBTQ+ rights",
          "Reproductive rights",
          "Stop Asian Hate",
          "Voter rights"]
      ]

    let action: () -> Void
    
    var body: some View {
        VStack (alignment: .center) {
            
            Image("BuildProfile_blurPhoto")
                .padding(.bottom, -125)
                .padding(.top, -20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 0.3)
                    )
                
                VStack {
                    Spacer()
                        .frame(height: 50)
                    
                    ScrollView {
                        Text("hobbies")
                            .font(.poppins(.semibold, size: 25))
                            .padding(.bottom, 20)
                        
                        var sortedHobbies : [String] = Array(hobbies.keys).sorted()
                        
                        ForEach(0..<sortedHobbies.count) { index in
                            if let items = hobbies[sortedHobbies[index]] {
                                HobbiesSectionView(header: sortedHobbies[index], list: items)
                                    .padding(.vertical, 20)
                                
                                if (index != sortedHobbies.count - 1) {
                                    Divider()
                                        .frame(height: 0.5)
                                        .overlay(Color.theme.grey)
                                        .padding(.horizontal, 20)
                                }
                            }
                        }
                        .padding(.horizontal, 40)
                    }
                    
                    Spacer()
                    
//                    Text("what do you like to do in your free time?")
//                        .multilineTextAlignment(.center)
//                        .font(.poppins(.regular, size: 12))
//                        .padding(.bottom, 15)
//                        .padding(.horizontal, 40)
                    
                    // To next build profile prompts!
                    Button {
                        action()
                    } label: {
                        Text("next")
                            .frame(width: 280, height: 16)
                            .font(.poppins(.semibold, size: 18))
                    }
                    .buttonStyle(FilledButton())
                    .padding(.vertical, 30)
                    
                    ProgressView(value: 0.70)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 70)
                
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct HobbiesView_Previews: PreviewProvider {
    static var previews: some View {
        HobbiesView() {}
    }
}

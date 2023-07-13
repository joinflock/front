//
//  InterestsView.swift
//  flock
//
//  Created by James Zhang on 7/7/23.
//

import SwiftUI

struct InterestsView: View {
    
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
                        .frame(height: 40)
                    
                    ScrollView {
                        Text("interests")
                            .font(.poppins(.semibold, size: 25))
                            .padding(.bottom, -5)
                        
                        var sortedHeaders : [String] = Array(interestsList.keys).sorted()
                        
                        ForEach(0..<sortedHeaders.count) { index in
                            if let items = interestsList[sortedHeaders[index]] {
                                InterestsSectionView(header: sortedHeaders[index], list: items)
                                    .padding(.bottom, 50)
                                    .padding(.top, 20)
                                
                                if (index != sortedHeaders.count - 1) {
                                    Divider()
                                        .frame(height: 0.4)
                                        .overlay(Color.theme.grey)
                                        .padding(.horizontal, 20)
                                }
                            }
                        }
                        .padding(.horizontal, 40)
                    }
                    
                    Spacer()
                    
                    Text("pick at least 5 and at max 10!")
                                            .multilineTextAlignment(.center)
                                            .font(.poppins(.regular, size: 14))
                                            .padding(.horizontal, 40)
                                            .padding(.bottom, 5)
                                            .padding(.top, 10)
                    
                    // To next build profile prompts!
                    Button {
                        action()
                    } label: {
                        Text("next")
                            .frame(width: 280, height: 16)
                            .font(.poppins(.semibold, size: 18))
                    }
                    .buttonStyle(FilledButton())
                    .padding(.bottom, 30)
                    
                    ProgressView(value: 0.70)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 70)
                
                }
            }
        }
        .ignoresSafeArea()
    }
    
    // Placed lower here for code visibility above. 
    @State private var interestsList = [
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
          "Voter rights"],
        "Academic & Professional" :[
        "Agriculture",
        "Art",
        "Architecture",
        "Biology",
        "Business",
        "Chemistry",
        "Computer Science",
        "Consulting",
        "Education",
        "Engineering",
        "Entrepreneurship",
        "Finance",
        "Healthcare",
        "History",
        "Human Resources",
        "Information Technology",
        "Law",
        "Management",
        "Marketing",
        "Mathematics",
        "Media",
        "Music",
        "Nursing",
        "Physics",
        "Physicians",
        "Psychiatrist",
        "Safety and Security",
        "Public Service",
        "Research",
        "Sales",
        "Student",
        "Software Development"]
      ]
}


struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView() {}
    }
}

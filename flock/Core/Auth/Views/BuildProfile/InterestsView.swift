//
//  InterestsView.swift
//  flock
//
//  Created by James Zhang on 7/7/23.
//

import SwiftUI

struct InterestsView: View {
    
    @Binding var interests: [String]
    
    let action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in

            VStack (alignment: .center) {
            Text("what interests you?")
                    .font(.system(size: 35, weight: .semibold))
                    .multilineTextAlignment(.center)
                .padding(.top, geometry.size.height * 0.10)
                .padding(.bottom, geometry.size.height * 0.01)

            Divider()


        ScrollView {
                        
                        
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
                                        
                                }
                            }
                        }
                    }
                    
                    Spacer()
            Divider()

                    Text("pick at least 5 and at max 10!")
                                            .multilineTextAlignment(.center)
                                            .font(.system(size: 16, weight: .regular))
                                            
                                            .offset(y: -(geometry.size.height * 0.05))
                                            .padding(.top, geometry.size.height * 0.06)
            
                    
                    // To next build profile prompts!
                    Button {
                        action()
                    } label: {
                        Text("next")
                            .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .buttonStyle(FilledButton())
                    .offset(y: -(geometry.size.height * 0.05))
            
                    ProgressView(value: 0.70)
                .frame(width:   geometry.size.width * 0.80, height:   geometry.size.height * 0.02)
                .offset(y: -(geometry.size.height * 0.04))
                
                
            }
        .padding(.horizontal, geometry.size.width * 0.1)
        }
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
        InterestsView(interests: .constant([])) {}
    }
}

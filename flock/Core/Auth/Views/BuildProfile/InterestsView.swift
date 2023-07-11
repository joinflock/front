//
//  InterestsView.swift
//  flock
//
//  Created by James Zhang on 7/7/23.
//

import SwiftUI

struct InterestsView: View {
    
    @State private var interestsList = [
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
        "Software Development"
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
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 0.3)
                    )
                
                VStack {
                    Text("interests")
                        .font(.poppins(.semibold, size: 25))
                        .padding(.top, 50)
                        .padding(.bottom, 20)
                    
                    ScrollView {
                        ForEach(interestsList, id: \.self) { interest in
                            ZStack {
                                CustomInterestsButton(text: interest, action: action)
            
                            }
                            .padding(.horizontal, 40)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                    
                    Text("pick at least 2 and at max 5")
                        .multilineTextAlignment(.center)
                        .font(.poppins(.regular, size: 12))
                        .padding(.bottom, 15)
                        .padding(.horizontal, 40)
                    
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
                    
                    ProgressView(value: 0.55)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 70)
                }
            }
            
        }
        .ignoresSafeArea()
    }
}

struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView() {}
    }
}

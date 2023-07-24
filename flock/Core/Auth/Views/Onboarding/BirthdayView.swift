//
//  BirthdayView.swift
//  flock
//
//  Created by James Zhang on 6/28/23.
//

import SwiftUI

struct BirthdayView: View {
    @Binding var birthday: Date
   
    // User can only be between 18-100 years old.
    var currentDate = Date()
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year,
                                        value: -100, to: currentDate)!
        let max = Calendar.current.date(byAdding: .year,
                                        value: -18, to: currentDate)!
        return min...max
    }

    let action: () -> Void
    var body: some View {
        GeometryReader { geometry in
            
            VStack (alignment: .center) {
                Text("when's your birthday?")
                    .font(.system(size: 35, weight: .semibold))
                    .foregroundColor(Color.theme.text)
                    .padding(.top, geometry.size.height * 0.25)
                    .padding(.bottom, geometry.size.height * 0.05)
                
                DatePicker(selection: $birthday, in: dateRange, displayedComponents: .date) {
                }
                .labelsHidden()
                .datePickerStyle(.wheel)
               
                Text("flock is for 18+ only")
                    .font(.system(size: 14, weight: .regular))              .foregroundColor(Color.theme.text)
                    .multilineTextAlignment(.center)
                    
                Spacer()

                // Move onto next onboarding step.
                Button {
                    action()
                } label: {
                    Text("next")
                        .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)
                    .font(.system(size: 20, weight: .semibold))                }
                .buttonStyle(FilledButton())
                .offset(y: -(geometry.size.height * 0.09))            }
            .padding(.horizontal, geometry.size.width * 0.1)

        }
        
        }
    }

struct BirthdayView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayView(birthday: .constant(Date())) {}
    }
}

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
        VStack (alignment: .center, spacing: 15) {
            Text("when's your birthday?")
                .font(.poppins(.semibold))
                .foregroundColor(Color.theme.text)
                .padding(.bottom, 5)
                
            DatePicker(selection: $birthday, in: dateRange, displayedComponents: .date) {
            }
                .labelsHidden()
                .datePickerStyle(.wheel)
                
            Text("flock is for 18+ only")
                .font(.poppins(.regular, size: 12))
                .foregroundColor(Color.theme.text)
                .multilineTextAlignment(.center)
                .padding(.bottom, 100)
            
            // Move onto next onboarding step.
            Button {
                action()
            } label: {
                Text("next")
                    .frame(width: 280, height: 16)
                    .font(.poppins(.semibold, size: 18))
            }
            .buttonStyle(FilledButton())
            .padding(.bottom, 5)
            }
        }
    }

struct BirthdayView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayView(birthday: .constant(Date())) {}
    }
}

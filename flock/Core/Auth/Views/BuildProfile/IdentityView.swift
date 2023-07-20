//
//  IdentityView.swift
//  flock
//
//  Created by James Zhang on 7/6/23.
//

import SwiftUI

struct IdentityView: View {
    @State private var selectedGender: String? = nil
    
    // Used to retrieve "other" input.
    @Binding var gender: String
    @Binding var ethnicity: String
    
    let action: () -> Void
    
    // Retrieved from ChatGPT ask.
    let genders = [
        "male",
        "female",
        "other"
    ]
    
    let ethnicities = [
        "african",
        "asian",
        "caucasian",
        "hispanic/latino",
        "indigenous/native american",
        "middle eastern",
        "multiracial/mixed",
        "pacific islander",
        "other"
    ]
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack (alignment: .center){
                ScrollView {
                    Text("identity")
                        .font(.poppins(.semibold, size: 25))
                        .padding(.top, geometry.size.height * 0.10)
                    //                    CustomInputField(imageName: "circle", placeholderText: "gender", text: $gender)
                    //                        .padding(.horizontal, 40)
                    //                        .padding(.top, 50)
                    //
                    //                    CustomInputField(imageName: "circle", placeholderText: "ethnicity", text: $ethnicity)
                    //                        .padding(.horizontal, 40)
                    //                        .padding(.top, 35)
                    //
                    
                    Text("gender")
                        .font(.poppins(.medium, size: 18))
                    //                            .foregroundColor(Color.theme.grey)
                        .padding(.vertical, geometry.size.height * 0.02)

                    ForEach(genders, id: \.self) { gender in
                        SingleSelectionView(selection: gender, selected: $selectedGender, otherInput: $gender)
                    }
                    .padding(.horizontal, geometry.size.width * 0.125)                    .padding(.vertical, geometry.size.height * 0.005)
                    
                    Divider()
                        .padding(.horizontal, geometry.size.width * 0.125)
                        .padding(.vertical, geometry.size.height * 0.01)

                    
                    Text("ethnicity")
                        .font(.poppins(.medium, size: 18))
                        .padding(.vertical, geometry.size.height * 0.005)
                    
                    ForEach(ethnicities, id: \.self) { ethn in
                        MultiselectTabView(text: ethn, otherInput: $ethnicity)
                            .font(.poppins(.regular, size: 16))
                    }
                    .padding(.horizontal, geometry.size.width * 0.125)
                    .padding(.vertical, geometry.size.height * 0.005)

                }
                Spacer()
                
                Group {
                    Text("your information is safe with us. view our ") +
                    Text("privacy policy").underline() +
                    Text(" .")
                }
                .padding(.top, geometry.size.height * 0.05)
                .multilineTextAlignment(.center)
                .font(.poppins(.regular, size: 12))
                .offset(y: -(geometry.size.height * 0.05))

                
                
                // To next build profile prompts!
                Button {
                    action()
                } label: {
                    Text("next")
                        .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)                        .font(.poppins(.semibold, size: 18))
                }
                .buttonStyle(FilledButton())
                .offset(y: -(geometry.size.height * 0.05))

                ProgressView(value: 0.23)   // arbitrarily valued
                    .frame(width:   geometry.size.width * 0.80, height:   geometry.size.height * 0.02)
                    .offset(y: -(geometry.size.height * 0.04))
                
                
                
            }
        }
    }
}

struct IdentityView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
            @State private var ethnicity = ""
            @State private var selectedGender = ""
            
            var body: some View {
                IdentityView(gender: .constant(""), ethnicity: $ethnicity) {}
            }
        }
}

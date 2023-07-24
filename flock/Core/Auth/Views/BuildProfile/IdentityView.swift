//
//  IdentityView.swift
//  flock
//
//  Created by James Zhang on 7/6/23.
//

import SwiftUI

struct IdentityView: View {
    @State private var selectedGender: String? = nil
    
    @State private var otherEthnicity: String? = nil
    
    // Used to retrieve "other" input.
    @Binding var gender: String
    @Binding var ethnicity: [Bool]
    
    let action: () -> Void
    
    // Retrieved from ChatGPT ask.
    let genders = [
        "male",
        "female",
        "other"
    ]
    
    @State var ethnicities = [
        "african",
        "asian",
        "caucasian",
        "hispanic/latino",
        "indigenous/native american",
        "middle eastern",
        "pacific islander",
        "other"
    ]
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack (alignment: .center){
                
                
                VStack {
                    ScrollView {
                        Text("identity")
                            .font(.poppins(.semibold, size: 25))
                            .padding(.top, 40)
                        
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
                            .padding(.vertical, 15)
                        
                        ForEach(genders, id: \.self) { gender in
                            SingleSelectionView(selection: gender, selected: $selectedGender, otherInput: $gender)
                                .onChange(of: selectedGender) { change in
                                    if selectedGender != "other" {
                                        self.gender = selectedGender!
                                    }
                                }
                        }
                        .padding(.horizontal, 50)
                        .padding(.vertical, 5)
                        
                        Divider()
                            .padding(.horizontal, 40)
                            .padding(.vertical, 25)
                        
                        Text("ethnicity")
                            .font(.poppins(.medium, size: 18))
                            .padding(.bottom, 15)
                        
                        
                        ForEach(self.ethnicities.indices, id: \.self) { i in
                            MultiselectTabView(text: self.ethnicities[i], index: i, arr: $ethnicity) {}
                                .padding(.horizontal, 50)
                                .padding(.vertical, 5)
                        }
                        
                        
                        Divider()
                        
                        
                        Group {
                            Text("your information is safe with us. view our ") +
                            Text("privacy policy").underline() +
                            Text(" .")
                        }
                        
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14, weight: .regular))
                        .offset(y: -(geometry.size.height * 0.05))
                        .padding(.top, geometry.size.height * 0.06)
                        
                        
                        
                        
                        // To next build profile prompts!
                        Button {
                            action()
                        } label: {
                            Text("next")
                                .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)                        .font(.system(size: 20, weight: .semibold))
                        }
                        .buttonStyle(FilledButton())
                        .offset(y: -(geometry.size.height * 0.05))
                        
                        ProgressView(value: 0.23)   // arbitrarily valued
                            .frame(width:   geometry.size.width * 0.80, height:   geometry.size.height * 0.02)
                            .offset(y: -(geometry.size.height * 0.04))
                        
                        
                        
                    }
                    .padding(.horizontal, geometry.size.width * 0.1)
                }
            }
        }
    }
}


    
struct IdentityView_Previews: PreviewProvider {
    static var previews: some View {
        IdentityView(gender: .constant(""), ethnicity: .constant([])) {}
    }
}


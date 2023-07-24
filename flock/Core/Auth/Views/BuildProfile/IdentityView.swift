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
                
                Text("identity")
                    .font(.system(size: 35, weight: .semibold))
                    .padding(.top, geometry.size.height * 0.10)
                    .padding(.bottom, geometry.size.height * 0.02)
                Divider()
            
                    
                
                  
                ScrollView {
                    
                    //                    CustomInputField(imageName: "circle", placeholderText: "gender", text: $gender)
                    //                        .padding(.horizontal, 40)
                    //                        .padding(.top, 50)
                    //
                    //                    CustomInputField(imageName: "circle", placeholderText: "ethnicity", text: $ethnicity)
                    //                        .padding(.horizontal, 40)
                    //                        .padding(.top, 35)
                    //
                    
                    Text("gender")
                        .font(.system(size: 20, weight: .medium))
                        .padding(.top, geometry.size.height * 0.01)
                    //                            .foregroundColor(Color.theme.grey)

                    ForEach(genders, id: \.self) { gender in
                        SingleSelectionView(selection: gender, selected: $selectedGender, otherInput: $gender)
                    }
                                        .padding(.vertical, geometry.size.height * 0.005)
                    
                    Divider()
                       
                        .padding(.vertical, geometry.size.height * 0.01)

                    
                    Text("ethnicity")
                        .font(.system(size: 20, weight: .medium))
                       
                    
                    ForEach(ethnicities, id: \.self) { ethn in
                        MultiselectTabView(text: ethn, otherInput: $ethnicity)
                            .font(.system(size: 16, weight: .regular))
                    }
                    
                    .padding(.vertical, geometry.size.height * 0.005)

                }
                Spacer()
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

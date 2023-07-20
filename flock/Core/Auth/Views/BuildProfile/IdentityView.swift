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
    @State var ethnicity: [Bool]
    
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
        VStack (alignment: .center){
            
            Image("BuildProfile_blurPhoto")
                .padding(.bottom, -180)
                .padding(.top, -20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 0.3)
                    )
                
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
                            MultiselectTabView(text: self.ethnicities[i]) {
                                self.ethnicity[i].toggle()
                            }
                            .padding(.horizontal, 50)
                            .padding(.vertical, 5)
                        }


                        

                    }
                    Spacer()
                    
                    Group {
                        Text("your information is safe with us. view our ") +
                        Text("privacy policy").underline() +
                        Text(" .")
                    }
                    .multilineTextAlignment(.center)
                    .font(.poppins(.regular, size: 12))
                    .padding(.vertical, 15)
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
                    
                    ProgressView(value: 0.23)   // arbitrarily valued
                        .padding(.horizontal, 40)
                        .padding(.bottom, 70)
                    
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct IdentityView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
            @State private var selectedGender = ""
            
            var body: some View {
                IdentityView(gender: .constant(""), ethnicity: []) {}
            }
        }
}

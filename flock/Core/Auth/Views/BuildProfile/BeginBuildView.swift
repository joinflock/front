//
//  BeginBuildView.swift
//  flock
//
//  Created by James Zhang on 7/6/23.
//

import SwiftUI
import DYPopoverView

struct BeginBuildView: View {
    @Binding var university: String
    @Binding var collegeEmail: String
    @Binding var hometown: String
    
    @State private var showUniPopover  = false
    @State private var clicked = false
    @State private var popoverPosition: ViewPosition = .bottom
    
    let universities : [UniversitiesData] = Bundle.main.decode("usInstitutions.json")
    
    var filteredUniResults: [UniversitiesData] {
        if university.isEmpty {
            return universities
        } else {
            // Filtering can be changed later... (1) hasPrefix() or (2) simply contains()
            var filteredUni = universities.filter {
                // Lower cases everything so input cases don't matter.
                $0.institution.lowercased().hasPrefix(university.lowercased()) }
            
            // Don't show bar if no suggestions exist.
            if filteredUni.count == 0 {
                showUniPopover = false
            }
            return filteredUni
        }
    }
    
    let action: () -> Void
    
    var body: some View {
        VStack (alignment: .center){
            
            Image("BuildProfile_blurPhoto")
                .scaledToFill()
                .padding(.bottom, -180)
            
            ZStack {
                // "Card"-like canvas for input. Overlay 2 RRs together since for some reason, two modifiers can't be used together on RR. **
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 0.3)
                    )
                    .ignoresSafeArea()
                
                VStack {
                    Text("we'd hate to waste your time")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.top, 40)
                        .foregroundColor(.secondary)
                    
                    // Grouped to color a specific section of text.
                    Group {
                        Text("let's ") +
                        Text("build your profile ").foregroundColor(Color.theme.accent) +
                        Text("in less than a minute")
                    }
                    .font(.system(size: 25, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, 15)
                    .padding(.bottom, 25)
                    
                    
                    CustomInputField(imageName: "circle", placeholderText: "university", text: $university)
                        .padding(.horizontal, 40)
                        .padding(.top, 20)
                        .onChange(of: university) { toggle in
                            // Always showing during mid-typing.
                            if clicked == false {
                                showUniPopover = true
                            }
                            else {
                                showUniPopover = false
                                clicked = false
                            }
                            
                            if university == "" {
                                // Disappear when completely deleted or have no suggestions.
                                showUniPopover = false
                            }
                        }
                        .anchorView(viewId: "UniPopover")
                       
                    
                    CustomInputField(imageName: "circle", placeholderText: "college email", text: $collegeEmail)
                        .padding(.horizontal, 40)
                        .padding(.top, 30)
                    
                    AutoCustomInputField(imageName: "circle", placeholderText: "hometown", text: $hometown)
                        .padding(.horizontal, 40)
                        .padding(.top, 30)
                    
                    
                    Spacer()
                    
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
                    
                    ProgressView(value: 0.03)   // arbitrarily valued
                        .padding(.horizontal, 40)
                        .padding(.bottom, 70)
                }
            }

        }
        .popoverView(content: {
            ScrollView {
                LazyVStack (alignment : .center){
                    Spacer(minLength: 15)
               
                    ForEach(filteredUniResults) { uni in
                        Text(uni.institution)
                            .onTapGesture {
                                university = uni.institution
                                clicked = true
                            }
                            .padding(.vertical, 5)
                            .multilineTextAlignment(.center)
                            
                        Divider()
                    }
                    
                }}
                .frame(width: 260)      // make sure to coordinate with frame attribute on bottom
        },
                     background: {BlurView(style: .systemChromeMaterial)},
                     isPresented: $showUniPopover,
                     frame: .constant(CGRect(x: 0, y: 0, width: 300, height: 200)),
                     anchorFrame: nil, popoverType: .popout, position: popoverPosition, viewId: "UniPopover", settings: DYPopoverViewSettings(shadowRadius: 20, animation: .default))
        .ignoresSafeArea()
    }
}

struct BeginBuildView_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
            @State private var university = ""
            
            var body: some View {
                BeginBuildView(university: $university, collegeEmail: .constant(""), hometown: .constant("")) {}
            }
        }
}

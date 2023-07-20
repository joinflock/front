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
    @Binding var homeCountryState: String
    
    @State private var popoverPosition: ViewPosition = .bottom
    
    // For university popover.
    @State private var showUniPopover  = false
    @State private var clickedUni = false
    
    let universities : [UniversitiesData] = UniversitiesData.allUni
    
    var filteredUniResults: [UniversitiesData] {
        if university.isEmpty {
            return universities
        } else {
            // Filtering can be changed later... (1) hasPrefix() or (2) simply contains()
            let filteredUni = universities.filter {
                // Lower cases everything so input cases don't matter.
                $0.institution.lowercased().hasPrefix(university.lowercased()) }
            
            // Don't show bar if no suggestions exist.
            if filteredUni.count == 0 {
                showUniPopover = false
            }
            return filteredUni
        }
    }
    
    // For hometown popover.
    @State private var showHomePopover = false
    @State private var clickedHome = false
    
    let countriesStates : [CountryStateData] = CountryStateData.allCountryState
    
    var filteredCountryStateResults: [CountryStateData] {
        if homeCountryState.isEmpty {
            return countriesStates
        } else {
            let filteredCS = countriesStates.filter {
                $0.name.lowercased().contains(homeCountryState.lowercased())
            }
            
            if filteredCS.count == 0 {
                showHomePopover = false
            }
            return filteredCS
        }
    }
    
    let action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack (alignment: .center){
                
                Text("we'd hate to waste your time")
                    .font(.system(size: 22, weight: .semibold))
                    .padding(.top, geometry.size.height * 0.15)
                    .foregroundColor(.secondary)
                
                // Grouped to color a specific section of text.
                Group {
                    Text("let's ") +
                    Text("build your profile ").foregroundColor(Color.theme.accent) +
                    Text("in less than a minute")
                }
                .font(.system(size: 25, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.top, geometry.size.height * 0.01)
                .padding(.bottom, geometry.size.height * 0.05)
                
                
                
                CustomInputField(imageName: "circle", placeholderText: "university", text: $university)
                    // .padding(.top, 20)
                    .padding(.top, geometry.size.height * 0.01)


                    .onChange(of: university) { change in
                        // Always showing during mid-typing.
                        if clickedUni == false {
                            showUniPopover = true
                        }
                        else {
                            showUniPopover = false
                            clickedUni = false
                        }
                        
                        if university == "" {
                            // Disappear when completely deleted or have no suggestions.
                            showUniPopover = false
                        }
                    }
                    .anchorView(viewId: "UniPopover")
                
                
                CustomInputField(imageName: "circle", placeholderText: "college email", text: $collegeEmail)
                    .padding(.top, geometry.size.height * 0.03)

                
                CustomInputField(imageName: "circle", placeholderText: "home country or state", text: $homeCountryState)
                    .padding(.top, geometry.size.height * 0.03)
                    .onChange(of: homeCountryState) { change in
                        // Always showing during mid-typing.
                        if clickedHome == false {
                            showHomePopover = true
                        }
                        else {
                            showHomePopover = false
                            clickedHome = false
                        }
                        
                        if homeCountryState == "" {
                            // Disappear when completely deleted or have no suggestions.
                            showHomePopover = false
                        }
                    }
                    .anchorView(viewId: "HomeCSPopover")
                
                
                Spacer()
                // To next build profile prompts!
                Button {
                    action()
                } label: {
                    Text("next")
                        .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)                        .font(.poppins(.semibold, size: 18))
                }
                .buttonStyle(FilledButton())
                .offset(y: -(geometry.size.height * 0.05))

                
                ProgressView(value: 0.03)   // arbitrarily valued
                    .frame(width:   geometry.size.width * 0.80, height:   geometry.size.height * 0.02)
                    .padding(.vertical, geometry.size.height * 0.01)
                    .offset(y: -(geometry.size.height * 0.04))
                
                
            }
            .padding(.horizontal, geometry.size.width * 0.1)
            
            .popoverView(content: {
                ScrollView {
                    LazyVStack (alignment : .center){
                        Spacer(minLength: 15)
                        
                        ForEach(filteredUniResults) { uni in
                            Text(uni.institution)
                                .onTapGesture {
                                    university = uni.institution
                                    clickedUni = true
                                }
                                .padding(.vertical, 5)
                                .multilineTextAlignment(.center)
                            
                            Divider()
                        }
                        
                    }}
                //.frame(width: 260)
                .frame(width:  geometry.size.width * 0.20)
                
                
                // make sure to coordinate with frame attribute on bottom
            },
                         background: {BlurView(style: .systemChromeMaterial)},
                         isPresented: $showUniPopover,
                         frame: .constant(CGRect(x: 0, y: 0, width: 300, height: 200)),
                         anchorFrame: nil, popoverType: .popout, position: popoverPosition, viewId: "UniPopover", settings: DYPopoverViewSettings(shadowRadius: 20, animation: .default))
            .popoverView(content: {
                ScrollView {
                    LazyVStack (alignment : .center){
                        Spacer(minLength: 15)
                        
                        ForEach(filteredCountryStateResults) { loc in
                            Text(loc.name)
                                .onTapGesture {
                                    homeCountryState = loc.name
                                    clickedHome = true
                                }
                                .padding(.vertical, 5)
                                .multilineTextAlignment(.center)
                            
                            Divider()
                        }
                        
                    }}
                .frame(width: 260)      // make sure to coordinate with frame attribute on bottom
            },
                         background: {BlurView(style: .systemChromeMaterial)},
                         isPresented: $showHomePopover,
                         frame: .constant(CGRect(x: 0, y: 0, width: 300, height: 200)),
                         anchorFrame: nil, popoverType: .popout, position: popoverPosition, viewId: "HomeCSPopover", settings: DYPopoverViewSettings(shadowRadius: 20, animation: .default))
        }
    }
}

struct BeginBuildView_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
            @State private var university = ""
            @State private var hometown = ""
            
            var body: some View {
                BeginBuildView(university: $university, collegeEmail: .constant(""), homeCountryState: $hometown) {}
            }
        }
}

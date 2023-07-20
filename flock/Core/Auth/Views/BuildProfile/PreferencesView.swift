
//
//  PreferencesView.swift
//  flock
//
//  Created by James Zhang on 7/7/23.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    
    let destinationItem: String
    @Binding var categories: [String]
    @Binding var draggedItem: String?
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        // Swap Items
        if let draggedItem {
            let fromIndex = categories.firstIndex(of: draggedItem)
            if let fromIndex {
                let toIndex = categories.firstIndex(of: destinationItem)
                if let toIndex, fromIndex != toIndex {
                    withAnimation {
                        self.categories.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex ? (toIndex + 1) : toIndex))
                    }
                }
            }
        }
    }
}

struct PreferencesView: View {
    
    // Categories to be ranked.
    @State private var draggedItem: String?
   // @State private var ranking : [String] = [" 1", "2", "3", "4", "5"]
    @State private var categories: [String] = ["age", "hobbies", "interests", "identity", "university"]
    
    
    var action: () -> Void
    // OnboardingManager().finish()
    
    
    var body: some View {
        
            
            GeometryReader { geometry in
                
                VStack (alignment: .center) {
                  /*  Image("BuildProfile_blurPhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width)
                        .frame(height: geometry.size.height * 0.30)
                        .clipped()*/
                       // .edgesIgnoringSafeArea(.all)
                    
                    
                    
                    //Spacer()
                    
                        /*RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .frame(width: geometry.size.width)
                            .frame(height: geometry.size.height * 0.10)
                          .padding(.top, geometry.size.height * 0.20)
                           // .edgesIgnoringSafeArea(.bottom )*/
                        
                        
                        //.offset(y: geometry.size.height * -0.25 )
                        
                        //VStack (alignment: .center){
                        
                        
                        // )
                        
                        
                        
                        
                        
                    /*Spacer()
                        .padding(.vertical, geometry.size.height * 0.01)*/
                            
                    Group () {
                                (Text("what matters to you ") +
                                 Text("matters").underline() +
                                 Text(" to us."))
                            }
                            // .frame(height:100)
                    .offset(y: geometry.size.height * 0.05)
                            
                            .font(.poppins(.semibold, size: 25))
                    
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, geometry.size.width * 0.1)
                            .padding(.top, geometry.size.height * 0.0)
                            
                            .frame(height:   geometry.size.height * 0.20)
                    
                            //.offset(y: geometry.size.height * 0.075)
                            // .frame(height:100)
                            
                            
                            
                            //.offset(y:geometry.size.height * 0.25)
                            
                            
                            
                            HStack(spacing: 0){
                                VStack (spacing: 0){
                                    ForEach(categories, id: \.self) { cat in
                                        
                                        CategoryTab(text: cat)
                                            .onDrag {
                                                self.draggedItem = cat
                                                return NSItemProvider()
                                            }
                                            .onDrop(of: [.text],
                                                    delegate: DropViewDelegate(destinationItem: cat, categories: $categories, draggedItem: $draggedItem)
                                            )
                                        
                                    }
                                }
                                
                                //     .padding(.leading, geometry.size.width * 0.1)
                                    VStack (spacing: geometry.size.width * 0.09) {
                                        ForEach(1..<6) { num in
                                            Text(String(num))
                                                .overlay(
                                                    Circle()
                                                        .stroke()
                                                        .frame(width: geometry.size.width * 0.12, height: geometry.size.width * 0.12)
                                                        .shadow(color: (Color.theme.grey), radius: 1.5, x: 0, y: 0)
                                                )
                                                .font(.poppins(.semibold, size: 20))
                                        }
                                    }
                                
                                    .padding(.leading, geometry.size.width * 0.075)
                                
                            }
                            .padding(.horizontal, geometry.size.width * 0.1)
                           // .padding(.top, geometry.size.height * 0.05)
                            .padding(.vertical, geometry.size.height * 0.06)
                            
                    Spacer()

                            
                            Text("this will help us find better intersections for you!")
                                .multilineTextAlignment(.center)
                                .font(.poppins(.regular, size: 12))
                                .padding(.horizontal, geometry.size.width * 0.1)
                               // .padding(.bottom, geometry.size.height * 0.01)
                                .offset(y: -(geometry.size.height * 0.05))

                    

                            //   .padding(.vertical, 15)
                            //  .padding(.horizontal, 40)
                            
                            // To next build profile prompts!
                            Button {
                                action()
                            } label: {
                                Text("next")
                                //.frame(width: 280, height: 16)
                                // .frame(width: 280, height: 16)
                                    .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)
                                // .padding(.horizontal, geometry.size.width *)
                                    .font(.poppins(.semibold, size: 18))
                            }
                            .buttonStyle(FilledButton())
                            .offset(y: -(geometry.size.height * 0.05))

                           // .padding(.bottom, geometry.size.height * 0.03)
                   
                            //   .padding(.bottom, 30)
                            
                            ProgressView(value: 0.90)
                                .frame(width:   geometry.size.width * 0.80, height:   geometry.size.height * 0.02)
                                .offset(y: -(geometry.size.height * 0.04))
                            //Spacer()

                            
                        

                        
                        // .aspectRatio(contentMode: .fit)
                        
                        
                        
                    
                    //.edgesIgnoringSafeArea(.all)
                    
                }
            }
            
            
        }

    }


        
    



struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView() {}
    }
}



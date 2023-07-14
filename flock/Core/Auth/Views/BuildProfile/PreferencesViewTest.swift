
//
//  PreferencesView.swift
//  flock
//
//  Created by James Zhang on 7/7/23.
//
/*
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
            
            VStack (spacing: 0) {
                Image("BuildProfile_blurPhoto")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width)
                    .frame(height: geometry.size.height * 0.35)
                    .clipped()
                    .edgesIgnoringSafeArea(.all)

                
                
              //  Spacer()

                ZStack(){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .frame(width: geometry.size.width)
                        .frame(height: geometry.size.height * 0.65)
                    // .padding(.top, geometry.size.height * 0.20)
                        .edgesIgnoringSafeArea(.bottom )
                    
                
                //.offset(y: geometry.size.height * -0.25 )
                
                //VStack (alignment: .center){
                
                
                // )
                
                
               
                    
                    
                    VStack(){
                        Group () {
                            (Text("what matters to you ") +
                             Text("matters").underline() +
                             Text(" to us."))
                        }
                        // .frame(height:100)
                        .font(.poppins(.semibold, size: 25))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, geometry.size.width * 0.1)
                        .frame(height:100)
                        //.offset(y:geometry.size.height * 0.25)
                        
                        
                       // Spacer()
                        
                        HStack{
                            VStack (spacing: 4){
                                ForEach(categories, id: \.self) { cat in
                                    
                                    CategoryTab(text: cat)
                                        .onDrag {
                                            self.draggedItem = cat
                                            return NSItemProvider()
                                        }
                                        .onDrop(of: [.text],
                                                delegate: DropViewDelegate(destinationItem: cat, categories: $categories, draggedItem: $draggedItem)
                                        )
                                        .padding(.vertical, -3)
                                }
                            }
                            .padding(.horizontal, geometry.size.width * 0.1)
                            .padding(.horizontal, geometry.size.width * 0.05)

                            ZStack {
                                VStack (spacing: 33) {
                                    ForEach(1..<6) { num in
                                        Text(String(num))
                                            .overlay(
                                                Circle()
                                                    .stroke()
                                                    .frame(width: 40, height: 40)
                                                    .shadow(color: (Color.theme.grey), radius: 1.5, x: 0, y: 0)
                                            )
                                            .font(.poppins(.semibold, size: 20))
                                    }
                                }
                            }
                            .padding(.trailing, 40)
                            
                            
                            
                            // .padding(.trailing, 20)
                            /* Group{
                             VStack(spacing:0){
                             RoundedRectangle(cornerRadius: 0)
                             .frame(width: 25, height: 1)
                             RoundedRectangle(cornerRadius: 0)
                             .frame(width: 1, height: 290)
                             RoundedRectangle(cornerRadius: 0)
                             .frame(width: 25, height: 1)
                             
                             }
                             
                             }*/
                            
                            // Tabs to be ranked.
                            
                            
                        }
                        .padding(.top, geometry.size.height * 0.25)
                        //Spacer()
                        
                        
                        Text("this will help us find better intersections for you!")
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
                        
                        ProgressView(value: 0.90)
                            .padding(.horizontal, 40)
                            .padding(.bottom, 70)
                        
                    }
                    //.padding(.top: geometry.size.width)
                   // .aspectRatio(contentMode: .fit)
                    
                    
                    
                }
                //.edgesIgnoringSafeArea(.all)
                
                
            }
            }
           // .aspectRatio(contentMode: .fit)

        }
        
    }



struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView() {}
    }
}
*/

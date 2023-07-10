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
//    @State private var ranking : [String] = [" 1", "2", "3", "4", "5"]
    @State private var categories: [String] = ["age", "hobbies", "interests", "identity", "university"]
    
    let action: () -> Void
    
    var body: some View {
        VStack (alignment: .center) {
            
            Image("BuildProfile_blurPhoto")
                .padding(.bottom, -150)
                .padding(.top, -20)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 0.3)
                    )
                
                VStack {
                    Group {
                        Text("what matters to you ") +
                        Text("matters").underline() +
                        Text(" to us.")
                    }
                    .font(.poppins(.semibold, size: 25))
                    .padding(.top, 50)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 40)
                    .multilineTextAlignment(.center)
                
                    
                    // Tabs to be ranked.
                    ZStack {
                        VStack (spacing: 14) {
                            ForEach(1..<6) { num in
                                Text(String(num))
                                    .offset(x : 100)
                                    .font(.poppins(.light, size: 28))
                            }
                        }
                        
                        VStack {
                            ForEach(categories, id: \.self) { cat in

                                CategoryTab(text: cat)
                                    .onDrag {
                                        self.draggedItem = cat
                                        return NSItemProvider()
                                    }
                                    .onDrop(of: [.text],
                                        delegate: DropViewDelegate(destinationItem: cat, categories: $categories, draggedItem: $draggedItem)
                                    )
                                    .padding(.trailing, 60)
                                    .padding(.leading, 80)
                                    .padding(.vertical, -3)
                            }
                        }
                    }
       
                    
                    Spacer()
                    
                    Text("this will help us find better intersections for you!")
                        .multilineTextAlignment(.center)
                        .font(.poppins(.regular, size: 12))
                        .padding(.bottom, 15)
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
                        .padding(.bottom, 60)
                    
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView() {}
    }
}

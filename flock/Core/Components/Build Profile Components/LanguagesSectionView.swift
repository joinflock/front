//
//  LanguagesSectionView.swift
//  flock
//
//  Created by James Zhang on 7/13/23.
//

import SwiftUI

// Pretty much same as InterestsSectionView but made separate one just in case needed to make one of them unique. 
struct LanguagesSectionView: View {
    @State private var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStack
        
    var header : String
    var list : [String]
    
    @Binding var selectedLanguages: [String]
    
    var body: some View {
    
            VStack (alignment: .leading){
                Text(header)
                    .font(.poppins(.medium, size: 18))
                    .padding(.bottom, 5)
                
                // Indexing here hardcoded for 2 choices per row.
//                ForEach(0..<list.count) { index in
//                    if (index % 2 == 0) {
//                        HStack {
//                            CustomInterestsButton(text: list[index], action: {})
//
//                            if (index + 1 != list.count) {
//                                CustomInterestsButton(text: list[index + 1], action: {})
//                            }
//                        }
//                    }
//                }
                
                // Dynamic attempt (not just harded 2 per line)
                GeometryReader { geometry in
                    self.generateContent(in: geometry)
                }
            }
            .frame(height: totalHeight)// << variant for ScrollView/List
            //.frame(maxHeight: totalHeight) // << variant for VStack
        }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.list, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 3)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.list.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.list.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        CustomInterestsButton(text: text, action: {
            if selectedLanguages.contains(text) {
                let index = selectedLanguages.firstIndex(of: text)
                selectedLanguages.remove(at: index!)
            } else {
                selectedLanguages.append(text)
            }
        })
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct LanguagesSectionView_Previews: PreviewProvider {
    static var previews: some View {
        LanguagesSectionView(header: "A", list: [
            "Albanian",
            "Amharic",
            "Arabic",
            "Assamese",
            "Awadhi"
        ], selectedLanguages: .constant([]))
    }
}

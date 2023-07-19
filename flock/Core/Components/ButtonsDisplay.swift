//
//  ButtonsDisplay.swift
//  flock
//
//  Created by James Zhang on 7/19/23.
//

import SwiftUI

struct ButtonsDisplay: View {
    @State private var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStack
    
    let list : [String]
    
    var body: some View {
        VStack (alignment: .center) {
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
        Text(text)
            .padding(10)            // HARDCODED FOR NOW!!!
            .foregroundColor(.black)
            .font(.poppins(.regular, size: 16))
            .background (
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.theme.accent.opacity(0.1))
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.theme.accent, lineWidth: 0.5)
                }
            )
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

struct ButtonsDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsDisplay(list: ["Basketball", "Food", "Music"])
    }
}

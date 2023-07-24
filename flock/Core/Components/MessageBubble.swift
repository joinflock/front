//
//  MessageBubble.swift
//  flock
//
//  Created by Tadiyos Berhane on 7/24/23.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false

    var body: some View {
        GeometryReader {geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            VStack(alignment: message.recicived ? .leading : .trailing){
                HStack {
                    Text(message.text)
                        .padding()
                        .background(message.recicived ? Color.theme.accent.opacity(0.4): Color.theme.grey.opacity(0.5))
                        .cornerRadius(30)
                }
                .frame(maxWidth: width * 0.75, alignment: message.recicived ? .leading : .trailing)
                .onTapGesture {
                    showTime.toggle()
                }
                if showTime {
                    Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                        .font(.caption2)
                        .foregroundColor(Color.theme.grey)
                        .padding(message.recicived ? .leading : .trailing, width * 0.02)
                        
                }
                
            }
            .frame(maxWidth: .infinity, alignment: message.recicived ? .leading : .trailing)
            .padding(message.recicived ? .leading : .trailing)
            .padding(.horizontal, width * 0.025)
        }
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12345", text: "I wanna fly can you take me far away? give me a star to reach for tell me what it takes and ill go so high", recicived: false, timestamp: Date()))
    }
}

//
//  DirectMessageView.swift
//  flock
//
//  Created by Tadiyos Berhane on 7/24/23.
//

import SwiftUI

struct DirectMessageView: View {
    var numMessages = 20
    var messageArray = [
    "hey",
    "hey there buddy",
    "did you take me out to dinner yet",
    "no, not yet :(",
    "who is going to take me out to dinner then :(",
    "have you tried asking bucko?",
    "he's been really lively lately and a lot more sociable",
    "yea you're right, I should ask bucko if he wants to take me out to dinner :)"
    
    ]
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            VStack(alignment: .leading, spacing: 0 ){
              
                HStack(spacing: 0){
                    CircleImage(image: Image("defaultUser").resizable())
                        .frame(width: width * 0.125, height: width * 0.125)
                        .padding(.trailing, width * 0.05)
                        .padding(.leading, width * 0.05)
                      /*  .overlay(
                        RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.theme.accent, lineWidth: 1)
                        .frame( width: width * 0.15, height: width * 0.15)
                        .foregroundColor(Color.gray)
                        
                        )*/

                        
                    
                    // Need to retrieve user data and plug into here!!
                    Text("Bucko Burton")
                        .font(.system(size: 20, weight: .regular))
                        .frame(alignment: .bottom)
                }
                .padding(.horizontal, width * 0.05)
                .padding(.bottom, height * 0.01)

                

                
                Divider()
                    .padding(.bottom, height * 0.005)
                
                ScrollView{
                    ForEach(messageArray, id: \.self) { text in MessageBubble(message: Message(id: "12345", text: text, recicived: true, timestamp: Date()))
                            .padding(.vertical, height * 0.03)
                    }
                }
                
               /* ScrollView {
                    ForEach(0..<numMessages, id: \.self) {num in
                        VStack (spacing: 0) {
                            HStack(spacing: 0) {
                               
                                CircleImage(image: Image("defaultUser").resizable())
                                    .frame(width: width * 0.125, height: width * 0.125)
                                    .padding(.trailing, width * 0.05)
                                    
                                VStack(alignment: .leading) {
                                    Text("Name")
                                        .font(.system(size: 16, weight: .semibold))
                                    Text("Latest Message")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color.black)
                                   
                                       // .padding(.leading, width * 0.15)
                                    
                                }
                                
                                Spacer()
                                

                                Image(systemName: "arrowshape.turn.up.left")
                                    .resizable()
                                    .frame( width: height * 0.025, height: height * 0.025)
                                    .padding(.trailing, width * 0.02)

                                Image(systemName: "hand.thumbsup")
                                    .resizable()
                                    .frame( width: height * 0.025, height: height * 0.025)
                                    
                            }
                            Text("Today: 12:15 pm ")
                                .font(.system(size: 12))
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity)
                           
                        } .padding(.horizontal, width * 0.05)
                    }
                }
                */
                

                
                Divider()
                   
                
                HStack(){
                   
                    
                    
                    Image(systemName: "plus.app.fill").resizable()
                        .frame(width: height * 0.04, height: height * 0.04)
                        .padding(.trailing, width * 0.0)
                        
                    
                    Image(systemName: "camera.on.rectangle.fill").resizable()
                        .frame(width: width * 0.085, height: height * 0.04)
                        .padding(.trailing, width * 0.0)
                    
                   
                    Text("Send a message!")
                        .padding(.horizontal, width * 0.1)
                        .alignmentGuide(.leading) {d in d[HorizontalAlignment.leading]}
                        .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.theme.accent, lineWidth: 1)
                        .frame( width: width * 0.70, height: height * 0.05)
                        .foregroundColor(Color.gray)
                        .padding(.leading, width * 0.175)
       
                    )
                   
                    CircleImage(image:  Image(systemName: "paperplane.circle.fill").resizable())
                        .frame(width: width * 0.075, height: width * 0.075)
                        .padding(.leading, width * 0.045)
              
                }
                .padding(.horizontal, width * 0.05)
                .padding(.top, height * 0.015)
                
                


                
            }
            
        }
    }
}

struct DirectMessageView_Previews: PreviewProvider {
    static var previews: some View {
        DirectMessageView()
    }
}

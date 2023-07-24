//
//  LanguageView.swift
//  flock
//
//  Created by James Zhang on 7/13/23.
//

import SwiftUI

struct LanguageView: View {
    
    let action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
        VStack (alignment: .center) {
           
            
            Text("what languages do you speak?")
                .multilineTextAlignment(.center)
                .font(.system(size: 35, weight: .semibold))
                .padding(.top, geometry.size.height * 0.1)
                .padding(.bottom, geometry.size.height * 0.04)
                


        
                    
                    ScrollView {
                       
                        var sortedHeaders : [String] = Array(languageList.keys).sorted()
                        
                        ForEach(0..<sortedHeaders.count) { index in
                            if let items = languageList[sortedHeaders[index]] {
                                LanguagesSectionView(header: sortedHeaders[index], list: items)
                                
                                    .padding(.bottom, geometry.size.height * 0.06)
                                    .padding(.top, geometry.size.height * 0.012)

                                if (index != sortedHeaders.count - 1) {
                                    Divider()
                                        .frame(height: 0.4)
                                        .overlay(Color.theme.grey)
                                }
                            }
                        }
                       
                    }
                    .padding(.bottom, geometry.size.height * 0.05)

                    Spacer()

//                    Text("pick at least 1!")
//                        .multilineTextAlignment(.center)
//                        .font(.poppins(.regular, size: 14))
//                        .padding(.horizontal, 40)
//                        .padding(.bottom, 5)
//                        .padding(.top, 10)

                    // To next build profile prompts!
                    Button {
                        action()
                    } label: {
                        Text("next")
                            .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)                            .font(.system(size: 20, weight: .semibold))
                            
                    }
                    .buttonStyle(FilledButton())
                    .padding(.top, geometry.size.height * 0.04)

                    .offset(y: -(geometry.size.height * 0.05))

                    

                    ProgressView(value: 0.15)
                .frame(width:   geometry.size.width * 0.80, height:   geometry.size.height * 0.02)
                .offset(y: -(geometry.size.height * 0.04))
                }
        .padding(.horizontal, geometry.size.width * 0.1)
                
            
        }
    }
    
    @State private var languageList = [
        "A": [
              "Albanian",
              "Amharic",
              "Arabic",
              "Assamese",
              "Awadhi"
            ],
            "B": [
              "Bengali",
              "Bhojpuri",
              "Bulgarian",
              "Burmese"
            ],
            "C": [
              "Cantonese",
              "Catalan",
              "Cebuano",
              "Czech"
            ],
            "D": [
              "Danish",
              "Dutch"
            ],
            "E": [
              "English"
            ],
            "F": [
              "Farsi",
              "Fijian",
              "Finnish",
              "French",
              "Fula"
            ],
            "G": [
              "German",
              "Greek",
              "Gujarati"
            ],
            "H": [
              "Hebrew",
              "Hindi",
              "Hmong",
              "Hungarian"
            ],
            "I": [
              "Icelandic",
              "Igbo",
              "Indonesian",
              "Italian"
            ],
            "J": [
              "Javanese",
              "Japanese"
            ],
            "K": [
              "Kannada",
              "Kazakh",
              "Korean",
              "Kyrgyz"
            ],
            "L": [
              "Lithuanian"
            ],
            "M": [
              "Macedonian",
              "Magahi",
              "Maithili",
              "Malagasy",
              "Malayalam",
              "Mandarin Chinese",
              "Marathi",
              "Min Nan Chinese"
            ],
            "N": [
              "Nepali",
              "Norwegian"
            ],
            "O": [
              "Oriya",
              "Oromo"
            ],
            "P": [
              "Polish",
              "Portuguese",
              "Punjabi"
            ],
            "R": [
              "Romanian",
              "Russian",
              "Rundi"
            ],
            "S": [
              "Saraiki",
              "Serbo-Croatian",
              "Sindhi",
              "Sinhala",
              "Slovak",
              "Somali",
              "Spanish",
              "Sundanese",
              "Swahili",
              "Swedish"
            ],
            "T": [
              "Tajik",
              "Tamil",
              "Telugu",
              "Tetum",
              "Tswana",
              "Turkmen",
              "Turkish"
            ],
            "U": [
              "Ukrainian",
              "Urdu"
            ],
            "V": [
              "Vietnamese"
            ],
            "W": [
              "Wu Chinese"
            ],
            "X": [
                "Xhosa"
            ],
            "Y": [
              "Yoruba"
            ],
            "Z": [
              "Zhuang",
              "Zulu"
            ]
    ]
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView() {}
    }
}

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
        VStack (alignment: .center) {
            Image("BuildProfile_blurPhoto")
                .padding(.bottom, -125)
                .padding(.top, -20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 0.3)
                    )
                
                VStack {
                    Spacer()
                        .frame(height: 40)
                    
                    ScrollView {
                        Text("what languages do you speak?")
                            .multilineTextAlignment(.center)
                            .font(.poppins(.semibold, size: 25))
                            .padding(.horizontal, 40)

                        var sortedHeaders : [String] = Array(languageList.keys).sorted()
                        
                        ForEach(0..<sortedHeaders.count) { index in
                            if let items = languageList[sortedHeaders[index]] {
                                LanguagesSectionView(header: sortedHeaders[index], list: items)
                                    .padding(.bottom, 50)
                                    .padding(.top, 10)
                                
                                if (index != sortedHeaders.count - 1) {
                                    Divider()
                                        .frame(height: 0.4)
                                        .overlay(Color.theme.grey)
                                        .padding(.horizontal, 20)
                                }
                            }
                        }
                        .padding(.horizontal, 40)
                    }
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
                            .frame(width: 280, height: 16)
                            .font(.poppins(.semibold, size: 18))
                    }
                    .buttonStyle(FilledButton())
                    .padding(.bottom, 30)
                    .padding(.top, 20)

                    ProgressView(value: 0.15)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 70)
                }
                
            }
        }
        .ignoresSafeArea()
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

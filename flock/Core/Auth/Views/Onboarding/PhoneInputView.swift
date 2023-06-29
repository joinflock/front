//
//  PhoneInputView.swift
//  flock
//
//  Created by James Zhang on 6/29/23.
//

import SwiftUI

struct PhoneInputView: View {
    @EnvironmentObject var modelData : ModelData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PhoneInputView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneInputView()
            .environmentObject(ModelData())
    }
}

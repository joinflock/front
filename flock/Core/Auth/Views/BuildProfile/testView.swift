//
//  testView.swift
//  flock
//
//  Created by James Zhang on 7/6/23.
//

import SwiftUI

struct testView: View {
    var body: some View {
        Text("hello")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
            .ignoresSafeArea()
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}

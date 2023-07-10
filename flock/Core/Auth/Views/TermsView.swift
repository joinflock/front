//
//  TermsView.swift
//  flock
//
//  Created by Jack O'Donnell on 7/10/23.
//

import SwiftUI

struct TermsView: View {
    
    let action: () -> Void
    
    var body: some View {
        
        VStack {
            title
            content
            returnBtn
        }
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView {}
    }
}

private extension TermsView {
    var title: some View {
        Text("Terms and Conditions")
            .font(
                .system(.largeTitle, design: .rounded)
                .bold()
            )
            .padding(.bottom, 8)
    }
    
    var content: some View {
        ScrollView {
            Text("insert terms and conditions here")
        }
        .padding()
    }
    
    var returnBtn: some View {
        Button {
            
        } label: {
            Text("Return to sign up")
        }
        .buttonStyle(FilledButton())
    }
}

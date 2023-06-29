//
//  PictureUploadView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/29/23.
//

import SwiftUI

struct PictureUploadView: View {
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        ZStack {
            
            VStack {
                
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                Button {
                    
                    isPickerShowing = true
                    
                } label: {
                    Text("Select a photo")
                        .font(.poppins(.semibold))
                }
                .buttonStyle(FilledButton())
                
            }
            .sheet(isPresented: $isPickerShowing) {
                // Image picker
                ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
            }
        }
    }
}

struct PictureUploadView_Previews: PreviewProvider {
    static var previews: some View {
        PictureUploadView()
    }
}

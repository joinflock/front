//  PictureUploadView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/29/23.
//
import SwiftUI

struct PictureUploadView: View {
    @EnvironmentObject var modelData : ModelData

    @State var isPickerShowing = false
    @State var selectedImage: UIImage?

    var body: some View {
        VStack (alignment: .center){
            
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top, 280)
            }
            Button {
                
                isPickerShowing = true
                
            } label: {
                Text("Select a photo")
                    .font(.poppins(.semibold))
            }
            .buttonStyle(FilledButton())
            .padding(.top, 280)
            
            Group {
                Text("Upload a ") +
                Text("Profile Photo").foregroundColor(Color.theme.accent)
            }
            .font(.poppins(.semibold, size: 20))
            .padding(.top, 60)
            
            Divider()
                .frame(height: 1.5)
                .overlay(Color.theme.grey)
                .padding(.horizontal, 80)
                .padding(.top, 10)
            
            Spacer()
            
            // Need to be hooked up to backend for saving all data.
            NavigationLink {
                PreferencesView()
                    .environmentObject(modelData)
            } label: {
                Text("finish")
                    .frame(width: 280, height: 16)
                    .font(.poppins(.semibold, size: 18))
            }
            .buttonStyle(FilledButton())
            .padding(.bottom, 30)
            
            ProgressView(value: 1)
                .padding(.horizontal, 40)
                .padding(.bottom, 70)
            
        }
        .sheet(isPresented: $isPickerShowing) {
            // Image picker
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
    }
}


struct PictureUploadView_Previews: PreviewProvider {
    static var previews: some View {
        PictureUploadView()
            .environmentObject(ModelData())
    }
}

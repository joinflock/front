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
        VStack (alignment: .center) {
            Text("and one more thing...")
                .font(.poppins(.semibold, size: 23))
                .padding(.top, 130)
            
            ZStack {
                if selectedImage != nil {
                    CircleImage(image:
                                    Image(uiImage: selectedImage!)
                        .resizable()
                    )
                    .frame(width: 250, height: 250)
                    .padding(.top, 40)
                    
                }
                else {
                    CircleImage(image:
                                    Image("defaultUser")
                        .resizable()
                    )
                    .frame(width: 250, height: 250)
                    .overlay {
                        Circle().stroke(Color.theme.accent, lineWidth: 3)
                    }
                    .padding(.top, 40)
                }
                
                Button {
                    isPickerShowing = true
                    
                } label: {
                    Text("+")
                        .font(.poppins(.semibold, size: 40))
                        .foregroundColor(.white)
                }
                .background(Circle()
                    .fill(Color.theme.accent)
                    .frame(width: 45, height: 45)
                )
                .offset(x: 90, y: 110)
            }
            
            Group {
                Text("upload a ") +
                Text("profile photo").foregroundColor(Color.theme.accent)
            }
            .font(.poppins(.semibold, size: 23))
            .padding(.top, 20)
                        
            Divider()
                .frame(height: 1.5)
                .overlay(Color.theme.grey)
                .padding(.horizontal, 70)
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
        .ignoresSafeArea()
    }
}


struct PictureUploadView_Previews: PreviewProvider {
    static var previews: some View {
        PictureUploadView()
            .environmentObject(ModelData())
    }
}

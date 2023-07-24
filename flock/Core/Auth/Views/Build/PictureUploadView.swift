//  PictureUploadView.swift
//  flock
//
//  Created by Jack O'Donnell on 6/29/23.
//
import SwiftUI

struct PictureUploadView: View {
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?

    let action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack (alignment: .center) {
                Text("and one last thing...")
                    .font(.system(size: 35, weight: .semibold))
                    .padding(.top, geometry.size.height * 0.10)

                ZStack {
                    if selectedImage != nil {
                        CircleImage(image:
                                        Image(uiImage: selectedImage!)
                            .resizable()
                        )
                        .frame(width: geometry.size.width * 0.80,  height: geometry.size.width * 0.70)
                        .padding(.top, geometry.size.height * 0.05)

                    }
                    else {
                        CircleImage(image:
                                        Image("defaultUser")
                            .resizable()
                        )
                        .frame(width: geometry.size.width * 0.80,  height: geometry.size.width * 0.70)
                        .overlay {
                            Circle().stroke(Color.theme.accent, lineWidth: 3)
                        }
                        .padding(.top, geometry.size.height * 0.05)
                    }
                    
                    Button {
                        isPickerShowing = true
                        
                    } label: {
                        Text("+")
                            .font(.system(size: 40, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .background(Circle()
                        .fill(Color.theme.accent)
                        .frame(width: geometry.size.width * 0.15,  height: geometry.size.width * 0.15)
                    )
                    .offset(x: geometry.size.width * 0.25, y: geometry.size.width * 0.30)
                }
                
                Group {
                    Text("upload a ") +
                    Text("profile photo").foregroundColor(Color.theme.accent)
                }
                .font(.system(size: 25, weight: .semibold))
                .padding(.top, geometry.size.height * 0.025)
                
                
                
                Spacer()
                
                // Need to be hooked up to backend for saving all data.
                Button {
                    action()
                } label: {
                    Text("finish")
                        .frame(width:   geometry.size.width * 0.70, height:   geometry.size.height * 0.02)
                        .font(.poppins(.semibold, size: 18))
                }
                .buttonStyle(FilledButton())
                .offset(y: -(geometry.size.height * 0.05))

                ProgressView(value: 1)
                    .frame(width:   geometry.size.width * 0.80, height:   geometry.size.height * 0.02)
                    .offset(y: -(geometry.size.height * 0.04))
                
            }
            .padding(.horizontal, geometry.size.width * 0.1)

        }
        .sheet(isPresented: $isPickerShowing) {
            // Image picker
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
    }
}


struct PictureUploadView_Previews: PreviewProvider {
    static var previews: some View {
        PictureUploadView() {}
    }
}

//
//  EditProfileView.swift
//  CoconutList
//
//  Created by Sebastian on 2024/1/1.
//

import SwiftUI
import PhotosUI
import FirebaseStorage

struct EditProfileView: View {
    @StateObject var viewModel = EditProfileViewViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var isPickerShowing = false
    
    var body: some View {
       
        ZStack {
            VStack {
                if let user = viewModel.user {
                    
                    Button {
                        isPickerShowing = true
                    } label: {
                        if let selectedImage = viewModel.selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }
                        else {
                            AvatarView(avatarUrlString: user.avatar)
                        }
                       
                    }
                    .frame(width: 125, height: 125)
        
                        // Info
                            HStack() {
                                Text("Name: ")
                                    .bold()
                                    .padding()
                                
                                TextField("Name", text: $viewModel.name)
                                    .textFieldStyle(.automatic)
                                    .autocorrectionDisabled()
                            }
                            .padding()
                        TLButton(title: "Save", background: .red) {
                            viewModel.updateProfile { success in
                                if success {
                                    self.presentationMode.wrappedValue.dismiss()
                                } else {
                                    print("fail to update")
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 100, height: 50)
                        .padding()
        
                    
                    // Sign out
                } else {
                    Text("Loading Profile")
                }
                Spacer()
                
            }
            
            if(viewModel.isUpdating) {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(3)
            }
        }
            .navigationTitle("Edit Profile")
//            .sheet(isPresented: $isPickerShowing) {
//                ImagePicker(selectedImage: $viewModel.selectedImage, isPickerShowing: $isPickerShowing)
//            }
            .fullScreenCover(isPresented: $isPickerShowing) {
                ImagePicker(selectedImage: $viewModel.selectedImage, isPickerShowing: $isPickerShowing)
                    }
            .padding()
        
        
        .onAppear {
            viewModel.fetchUser()
        }
        
    }
        

}

#Preview {
    EditProfileView()
}

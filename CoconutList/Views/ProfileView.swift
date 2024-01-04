//
//  ProfileView.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//

import SwiftUI
import FirebaseFirestoreSwift
struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
     
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    // Avatar
                    AvatarView(avatarUrlString: user.avatar)
                    // Info
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        .padding()
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding()
                        HStack {
                            Text("Member Since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()
                    }
                    .padding()
                    
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    
                    .tint(.red)
                    .padding()
                    Spacer()
                    
                    // Sign out
                } else {
                    Text("Loading Profile")
                }
            }
           
           
            
            .navigationTitle("Profile")
            .toolbar {
                NavigationLink(destination: EditProfileView()) {
                          Text("Edit")
                       }
            }
            .onAppear {
               
                viewModel.fetchUser()
                
                
            }
           
            
        }
        
    }
}

#Preview {
    ProfileView()
}

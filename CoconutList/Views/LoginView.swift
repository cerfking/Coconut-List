//
//  LoginView.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//

import SwiftUI

struct LoginView: View {
   @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Coconut List", subtitle: "A to do list to help you get things done", angle: 15, background: .pink)
               
                 
                // Login Form
             
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                   
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color(uiColor: .secondarySystemBackground))
                    
                   
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color(uiColor: .secondarySystemBackground))
                    
                
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                    .offset(y:30)
                    
                    .frame(width: UIScreen.main.bounds.width - 100, height: 50)
                Spacer()
                
           
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 30)
                
            }
        }
    }
}

#Preview {
    LoginView()
}

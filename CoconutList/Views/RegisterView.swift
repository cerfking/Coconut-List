//
//  RegisterView.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
            
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding(20)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 50)
                    .background(Color(uiColor: .secondarySystemBackground))
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .padding(20)
                    .autocorrectionDisabled()
                    .frame(width: UIScreen.main.bounds.width - 100, height: 50)
                    
                    .background(Color(uiColor: .secondarySystemBackground))
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding(20)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 50)
                    .background(Color(uiColor: .secondarySystemBackground))
                    
                TLButton(title: "Create Account", background: .green) {
                    viewModel.register()
                }
            
                    .offset(y:30)
            
                    .frame(width: UIScreen.main.bounds.width - 100, height: 50)
            
          
           
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}

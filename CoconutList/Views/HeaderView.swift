//
//  HeaderView.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    var body: some View {
        
           
    
            VStack {
                Image("Coconut")
                    .resizable()
                    .scaledToFit()
                Text(title)
                    .foregroundColor(.primary)
                    .font(.system(size: 50))
                    .bold()
                Text(subtitle)
                    .foregroundColor(.secondary)
                    .font(.system(size: 20))
            }
            .padding(.top, 50)
        
        .frame(width: UIScreen.main.bounds.width, height: 300)
        .offset(y: -50)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
}

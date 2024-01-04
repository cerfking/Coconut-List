//
//  AvatarView.swift
//  CoconutList
//
//  Created by Sebastian on 2024/1/2.
//

import SwiftUI

struct AvatarView: View {
    let avatarUrlString: String
    var body: some View {
        AsyncImage(url: URL(string: avatarUrlString)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 125, height: 125)
        .padding()
        
    }
}

#Preview {
    AvatarView(avatarUrlString: "https://firebasestorage.googleapis.com:443/v0/b/coconutlist.appspot.com/o/avatars%2FOR1M2DnE1qR12pXQGToU79nb8I72Avatar.png?alt=media&token=d9d6f183-03cb-40bb-8ca1-6e0f6cd0d1eb")
}

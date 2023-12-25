//
//  ProfileViewRowOptions.swift
//  iHostal
//
//  Created by duverney muriel on 5/12/23.
//

import SwiftUI

struct ProfileViewRowOptions: View {
    let imageName: String
    let title: String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                Text(title)
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}

#Preview {
    ProfileViewRowOptions(imageName: "gear", title: "Settings")
}

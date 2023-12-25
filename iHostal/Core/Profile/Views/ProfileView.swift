//
//  ProfileView.swift
//  iHostal
//
//  Created by duverney muriel on 5/12/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            //        profile login view
            VStack(alignment: .leading,spacing: 32){
                VStack(alignment: .leading,spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Ingresa a planear tu siguiente viaje")
                }
                Button {
                    print("Log in")
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                HStack{
                    Text("No tienes cuenta aún?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }.font(.caption)
            }
            
//            profile options
            VStack(spacing:24){
                ProfileViewRowOptions(imageName: "gear", title: "Settings")
                ProfileViewRowOptions(imageName: "accessibility", title: "acessibility")
                ProfileViewRowOptions(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}

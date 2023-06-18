//
//  ProfileView.swift
//  ToDoListAppSwiftUI
//
//  Created by Tazo Gigitashvili on 13.06.23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        //info: name, email, member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(5)
            
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(5)
            
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(5)
        }
        .padding()
        
        //sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

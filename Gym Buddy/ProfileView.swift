//
//  ProfileView.swift
//  Gym Buddy
//
//  Created by Jake Garcia on 3/11/21.
//

import SwiftUI

struct ProfileView: View {
    let metallicGold = Color("metallicGold")
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    @State private var fName: String = ""
    @State private var lName: String = ""
    @State private var email: String = ""
    @State private var nameError: String = ""
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                if nameError != "" {
                    Text(nameError)
                        .font(.subheadline)
                        .foregroundColor(Color.red)
                }
                Text("Name")
                    .padding(.leading, 15)
                    .font(.headline)
                HStack {
                    Spacer()
                    TextField("First", text: $fName)
                        .foregroundColor(metallicGold)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(metallicGold)
                        )
                    TextField("Last", text: $lName)
                        .foregroundColor(metallicGold)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(metallicGold)
                        )
                    Spacer()
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Divider()
                VStack(alignment: .leading) {
                    Text("Email")
                        .padding(.leading, 15)
                        .font(.headline)
                    HStack {
                    TextField("", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(metallicGold)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(metallicGold)
                        )
                    }
                    .padding([.leading, .trailing], 10)
                }
                Divider()
                VStack {
                    Button(action: {
                        self.checkUserInfo()
                    }) {
                        Text("Save")
                    }
                    
                }
                Spacer()
            }
        }
    }
    
    func checkUserInfo () {
        self.validateName(name: fName)
        self.validateName(name: lName)
    }
    
    func validateName(name: String) {
        if name.count == 0 {
            nameError = "Name field cannot be left blank"
            return
        }
        for char in fName {
            let stringChar = String(char)
            if let _ = Int(stringChar) {
                nameError = "Name field cannot contain numbers"
                return
            }
        }
        nameError = ""
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

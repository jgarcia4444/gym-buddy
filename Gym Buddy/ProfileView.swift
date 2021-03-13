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
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
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
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

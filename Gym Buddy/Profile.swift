//
//  Profile.swift
//  Gym Buddy
//
//  Created by Jake Garcia on 3/16/21.
//

import SwiftUI

struct Profile: View {
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    var fullName: String {
        return "\(user.fName ?? "Test") \(user.lName ?? "User")"
    }
    var user : User {_users.wrappedValue[0]}
    @State private var editing = false
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Name")
                    .font(.headline)
                Text(fullName)
                Divider()
            }
            Group {
                Text("Email")
                    .font(.headline)
                Text(users[0].email ?? "test@example.com")
                Divider()
            }
            Group {
                Text("Height")
                    .font(.headline)
                Text(user.height ?? "70")
                Divider()
            }
            Group {
                Text("Weight")
                    .font(.headline)
                Text(user.weight ?? "200")
                Divider()
            }
            Group {
                Text("Age")
                    .font(.headline)
                Text(user.age ?? "100")
            }
            Group {
                Text("Gender")
                    .font(.headline)
                Text(user.gender ?? "Male")
            }
            Group {
                Text("Weight Goal")
                    .font(.headline)
                Text(user.weightGoal ?? "180")
            }
            Group {
                Button(action: {
                    Self.editing.toggle()
                })
            }
            
        }
        .padding([.leading, .trailing], 15)
        .navigationTitle(Text("Profile"))
        .navigationBarTitleDisplayMode(.large)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}

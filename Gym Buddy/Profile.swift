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
        return "\(users[0].fName ?? "Test") \(users[0].lName ?? "User")"
    }
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
                Text(users[0].height ?? "70")
                Divider()
            }
            Group {
                Text("Weight")
                    .font(.headline)
                Text(users[0].weight ?? "200")
                Divider()
            }
            Group {
                Text("Age")
                    .font(.headline)
                Text(users[0].age ?? "100")
            }
            Group {
                Text("Gender")
                    .font(.headline)
                Text(users[0].gender ?? "Male")
            }
            Group {
                Text("Weight Goal")
                    .font(.headline)
                Text(users[0].weightGoal ?? "180")
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

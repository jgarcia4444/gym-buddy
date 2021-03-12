//
//  HomeView.swift
//  Gym Buddy
//
//  Created by Jake Garcia on 3/11/21.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var mode
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users : FetchedResults<User>
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(mode == .dark ? .white : .black)                    }
                }
                    .padding([.leading, .trailing], 20)
                Spacer()
            }
        }
        .onAppear {
            print(self.userCreated())
        }
    }
    
    func userCreated() -> Bool {
        if users.count == 0 {
            return false
        }
        return true
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

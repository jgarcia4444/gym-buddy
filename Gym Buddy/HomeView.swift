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
    @State private var profileBtnAnimationAmount : CGFloat = 1
    var computedStrokeColor : Color {
        return mode == .dark ? Color.white : Color.black
    }
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(mode == .dark ? .white : .black)
                            
                            .overlay(
                                Circle()
                                    .stroke(mode == .dark ? Color.white : Color.black)
                                    .scaleEffect(self.userCreated() ? 0 : profileBtnAnimationAmount)
                                    .opacity(Double(2 - profileBtnAnimationAmount))
                                    .animation(
                                        Animation.easeOut(duration: 1)
                                            .repeatForever(autoreverses: false)
                                    )
                            )
                    }
                }
                    .padding([.leading, .trailing], 20)
                Spacer()
            }
            .onAppear {
                profileBtnAnimationAmount += 0.5
            }
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

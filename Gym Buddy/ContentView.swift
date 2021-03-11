//
//  ContentView.swift
//  Gym Buddy
//
//  Created by Jake Garcia on 3/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            Text("Lift Tracker")
                .tabItem {
                    Label("Lift", systemImage: "hammer.fill")
                }
            Text("Nutrition Tracker")
                .tabItem {
                    Label("Eat", systemImage: "note.text")
                }
            Text("Weight Tracker")
                .tabItem {
                    Label("Weigh", systemImage: "gauge")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

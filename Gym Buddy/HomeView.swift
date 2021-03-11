//
//  HomeView.swift
//  Gym Buddy
//
//  Created by Jake Garcia on 3/11/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home")
        }
        .transition(.slide)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

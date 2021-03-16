//
//  ProfileView.swift
//  Gym Buddy
//
//  Created by Jake Garcia on 3/11/21.
//

import SwiftUI

struct ProfileView: View {
    let metallicGold = Color("metallicGold")
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    @Environment(\.colorScheme) var colorMode
    var body: some View {
        ScrollView {
            if users.count == 0 {
                ProfileForm()
            }
            if users.count == 1 {
                Profile()
            }
        }
    }
    func styleSegmentedPicker() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(metallicGold)
        
        var selectedForegroundColor: UIColor?
        var normalForegroundColor : UIColor?
        
        if colorMode == .dark {
            selectedForegroundColor = UIColor.black
            normalForegroundColor = UIColor.white
        } else {
            selectedForegroundColor = UIColor.white
            normalForegroundColor = UIColor.black
        }
        
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: selectedForegroundColor!], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: normalForegroundColor!], for: .normal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

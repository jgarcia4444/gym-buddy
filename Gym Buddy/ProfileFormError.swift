//
//  ProfileFormError.swift
//  Gym Buddy
//
//  Created by Jake Garcia on 3/16/21.
//

import SwiftUI

struct ProfileFormError: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(Color.red)
            .padding(.leading, 15)
    }
}

struct ProfileFormError_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFormError(text: "Test Error")
    }
}

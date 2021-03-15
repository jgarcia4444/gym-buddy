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
    @Environment(\.colorScheme) var colorMode
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    @State private var fName = ""
    @State private var lName = ""
    @State private var email = ""
    @State private var nameError = ""
    @State private var height = ""
    let heightMetricPickerOptions = ["In", "Cm"]
    @State private var heightMetric = ""
    @State private var weight = ""
    let weightMetricPickerOptions = ["lbs", "kgs"]
    @State private var weightMetric = ""
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                if nameError != "" {
                    Text(nameError)
                        .font(.subheadline)
                        .foregroundColor(Color.red)
                }
                Group {
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
                }
                Group {
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
                }
                Group {
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Height")
                            .font(.headline)
                            .padding(.leading, 15)
                        HStack {
                            TextField("", text: $height)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .foregroundColor(metallicGold)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(metallicGold)
                                )
                            Picker("Height Metric", selection: $heightMetric) {
                                ForEach(0..<heightMetricPickerOptions.count) {
                                    Text(heightMetricPickerOptions[$0]).tag(heightMetricPickerOptions[$0])
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        .padding([.leading, .trailing], 10)
                    }
                }
                Group {
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Weight")
                            .font(.headline)
                            .padding(.leading, 15)
                        HStack {
                            TextField("", text: $weight)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .foregroundColor(metallicGold)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(metallicGold)
                                )
                            Picker("Weight Metric", selection: $weightMetric) {
                                ForEach(0..<weightMetricPickerOptions.count) {
                                    Text(weightMetricPickerOptions[$0]).tag(weightMetricPickerOptions[$0])
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        .padding([.leading, .trailing], 10)
                    }
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
            .onAppear {
                styleSegmentedPicker()
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
    
//    init() {
//        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(metallicGold)
//
//        var selectedForegroundColor: UIColor?
//        var normalForegroundColor : UIColor?
//
//        if colorMode == .dark {
//            print("Test")
//            selectedForegroundColor = UIColor.black
//            normalForegroundColor = UIColor.white
//        } else {
//            print(colorMode
//            )
//            selectedForegroundColor = UIColor.white
//            normalForegroundColor = UIColor.black
//        }
//
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: selectedForegroundColor!], for: .selected)
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: normalForegroundColor!], for: .normal)
//    }
    
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

//
//  ProfileForm.swift
//  Gym Buddy
//
//  Created by Jake Garcia on 3/16/21.
//

import SwiftUI

struct ProfileForm: View {
    let metallicGold = Color("metallicGold")
    @Environment(\.managedObjectContext) var moc
    @Environment(\.colorScheme) var colorMode
    @State private var fName = ""
    @State private var lName = ""
    @State private var email = ""
    @State private var emailError = ""
    @State private var fNameError = ""
    @State private var lNameError = ""
    @State private var height = ""
    let heightMetricPickerOptions = ["in", "cm"]
    @State private var heightMetric = ""
    @State private var weight = ""
    let weightMetricPickerOptions = ["lb", "kg"]
    @State private var weightMetric = ""
    @State private var age = ""
    let genderOptions = ["Male", "Female"]
    @State private var gender = ""
    @State private var weightGoal = ""
    @State private var heightError = ""
    @State private var weightError = ""
    @State private var ageError = ""
    @State private var genderError = ""
    @State private var weightGoalError = ""
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Group {
                    if fNameError != "" {
                        ProfileFormError(text: fNameError)
                    }
                    if lNameError != "" {
                        ProfileFormError(text: lNameError)
                    }
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
                    if emailError != "" {
                        ProfileFormError(text: emailError)
                    }
                    VStack(alignment: .leading) {
                        Text("Email")
                            .padding(.leading, 15)
                            .font(.headline)
                        HStack {
                        TextField("", text: $email)
                            .keyboardType(.emailAddress)
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
                    if heightError != "" {
                        ProfileFormError(text: heightError)
                    }
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
                    if weightError != "" {
                        ProfileFormError(text: weightError)
                    }
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
                Group {
                    Divider()
                    if ageError != "" {
                        ProfileFormError(text: ageError)
                    }
                    VStack(alignment: .leading) {
                        Text("Age")
                            .font(.headline)
                            .padding(.leading, 15)
                        HStack {
                            TextField("", text: $age)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
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
                    if genderError != "" {
                        ProfileFormError(text: genderError)
                    }
                    VStack(alignment: .leading) {
                        Text("Gender")
                            .font(.headline)
                            .padding(.leading, 15)
                        HStack {
                            Picker("Gender Selection", selection: $gender) {
                                ForEach(0..<genderOptions.count) {
                                    Text(genderOptions[$0]).tag(genderOptions[$0])
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        .padding([.leading, .trailing], 10)
                    }
                }
                Group {
                    Divider()
                    if weightGoalError != "" {
                        ProfileFormError(text: weightGoalError)
                    }
                    VStack(alignment: .leading) {
                        Text("Weight Goal")
                            .font(.headline)
                            .padding(.leading, 15)
                        HStack {
                            TextField("", text: $weightGoal)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .foregroundColor(metallicGold)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(metallicGold)
                                )
                            
                        }
                        .padding([.leading, .trailing], 10)
                    }
                }
            }
            Group {
                Divider()
                HStack {
                    Button(action: {
                        self.checkUserInfo()
                    }) {
                        Text("Save")
                            .padding([.top, .bottom], 10)
                            .frame(maxWidth: .infinity)
                            .background(metallicGold)
                            .foregroundColor(colorMode == .dark ? Color.black : Color.white)
                    }
                    
                    
                }
            }
        }
        .navigationTitle(Text("Profile"))
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            styleSegmentedPicker()
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

func checkUserInfo() {
    self.validateName(name: fName, input: "First")
    self.validateName(name: lName, input: "Last")
    self.validateEmail()
    self.validateHeight()
    self.validateWeight()
    self.validateAge()
    self.validateGender()
    self.validateWeightGoal()
}

func validateWeightGoal() {
    if weightGoal.count < 1 {
        weightGoalError = "Weight goal cannot be left empty"
    } else {
        if Int(weightGoal) == nil {
            weightGoalError = "Weight goal can only consist of numbers"
        } else {
            weightGoalError = ""
        }
    }
}

func validateGender() {
    if gender == "" {
        genderError = "Please select a gender"
    } else {
        genderError = ""
    }
}

func validateAge() {
    if age.count < 1 {
        ageError = "Age cannot be left empty"
    } else {
        if Int(age) == nil {
            ageError = "Age can only consist of numbers"
        } else {
            ageError = ""
        }
    }
}

func validateWeight() {
    if weight.count < 1 {
        weightError = "Weight cannot be left empty"
    } else {
        if Int(weight) == nil {
            weightError = "Weight can only consist of numbers"
        } else {
            if weightMetric == "" {
                weightError = "Please select pounds or kilograms"
            } else {
                weightError = ""
            }
        }
    }
}

func validateHeight() {
    if height.count < 1 {
        heightError = "Height cannot be left blank"
    } else {
        if Int(height) == nil {
            heightError = "Height can only consist of numbers."
        } else {
            if heightMetric == "" {
                heightError = "Please select inches or centimeters"
            } else {
                heightError = ""
            }
            
        }
    }
}

func validateEmail() {
    if email.count == 0 {
        emailError = "Email cannot be left blank"
    } else {
        let atSeperatedEmail = email.components(separatedBy: "@")
        if atSeperatedEmail.count == 2 {
            let secondHalf = atSeperatedEmail[1]
            let periodComponents = secondHalf.components(separatedBy: ".")
            if periodComponents.count == 2 {
                emailError = ""
                return
            } else {
                emailError = "An email must contain a '.'"
            }
        } else {
            emailError = "An email must containe an '@'"
        }
    }
}

func validateName(name: String, input: String) {
    var isValid = true
    if name.count == 0 {
        isValid = false
        if input == "First" {
            fNameError = "First name field cannot be left blank"
        } else {
            lNameError = "Last name field cannot be left blank"
        }
    }
    for char in name {
        let stringChar = String(char)
        if let _ = Int(stringChar) {
            isValid = false
            if input == "First" {
                fNameError = "First name field cannot contain numbers"
            } else {
                lNameError = "Last name field cannot contain numbers"
            }
        }
    }
    if isValid == true {
        if input == "First" {
            fNameError = ""
        } else {
            lNameError = ""
        }
        
    }
}

}


struct ProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        ProfileForm()
    }
}

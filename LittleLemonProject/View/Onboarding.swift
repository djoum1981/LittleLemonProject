//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Julien Laurent on 4/24/23.
//

import SwiftUI
let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        //NavigationView {
            VStack(spacing: 20){
                NavigationLink(isActive: $isLoggedIn) {
                    Home()
                } label: {
                    EmptyView()
                }
                Image("Logo")
                Spacer()
                
                VStack(spacing: 20){
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(CustomTextfieldStyle())
                        
                     TextField("Last Name", text: $lastName)
                        .textFieldStyle(CustomTextfieldStyle())
                        
                     TextField("Email", text: $email)
                        .textFieldStyle(CustomTextfieldStyle())
                }
                .padding(.horizontal)
                
                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty{
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        
                        
                        firstName = ""
                        lastName = ""
                        email = ""
                        
                        isLoggedIn = true
                        UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                    }else{
                        print("they are empty")
                    }
                }
                .buttonStyle(CustomButtonStyle())
    
                Spacer()
                Spacer()
            }
            .onAppear(perform: {
                if (UserDefaults().bool(forKey: kIsLoggedIn)){
                    isLoggedIn = true
                }
            })
            .padding()
        //}
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

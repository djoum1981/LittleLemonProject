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
    @State var isEmailValid: Bool = false
    @State var isError: Bool = false
    @State var errorMessage: String = ""
    
    private func validateEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
    
    
    var body: some View {
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
                        .onChange(of: email) { _ in
                            isEmailValid = validateEmail(email)
                            print(isEmailValid)
                        }
                }
                .padding(.horizontal)
                
                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty{
                        if isEmailValid{
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            
                            
                            firstName = ""
                            lastName = ""
                            email = ""
                            
                            isLoggedIn = true
                            UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                        }else{
                            errorMessage = "Email is not valid"
                            isError = true
                        }
                    }else{
                       errorMessage = "Check the information and try again"
                        isError = true
                    }
                }
                .alert("Error", isPresented: $isError, actions: {
                }, message: {
                    Text(errorMessage)
                })
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
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
